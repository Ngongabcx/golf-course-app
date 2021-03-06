import 'dart:math';

import 'package:flutter/material.dart';

class SearchCard extends StatefulWidget {

  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  late TextEditingController searchTextController;
  final ScrollController _scrollController = ScrollController();
  List currentSearchList = [];
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;

  @override
  void initState() {
    super.initState();
    // TODO: Call getPreviousSearches
    searchTextController = TextEditingController(text: '');
    _scrollController.addListener(() {
      final triggerFetchMoreSize =
          0.7 * _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels > triggerFetchMoreSize) {
        if (hasMore &&
            currentEndPosition < currentCount &&
            !loading &&
            !inErrorState) {
          setState(() {
            loading = true;
            currentStartPosition = currentEndPosition;
            currentEndPosition =
                min(currentStartPosition + pageCount, currentCount);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            // Replace
            const Icon(Icons.search),
            const SizedBox(
              width: 6.0,
            ),
            // *** Start Replace
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Search'),
                      autofocus: false,
                      controller: searchTextController,
                      onChanged: (query) => {
                        if (query.length >= 3)
                          {
                            // Rebuild list
                            setState(
                              () {
                                currentSearchList.clear();
                                currentCount = 0;
                                currentEndPosition = pageCount;
                                currentStartPosition = 0;
                              },
                            )
                          }
                      },
                    ),
                  ),
                ],
              ),
            ),
            // *** End Replace
          ],
        ),
      ),
    );
  }
}

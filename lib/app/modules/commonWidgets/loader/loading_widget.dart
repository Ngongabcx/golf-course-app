import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'loader.dart';
import 'loading_provider.dart';

class LoadingScreen {
  static TransitionBuilder init({
    TransitionBuilder builder,
  }) {
    return (BuildContext context, Widget child) {
      if (builder != null) {
        return builder(context, LoadingCustom(child: child));
      } else {
        return LoadingCustom(child: child);
      }
    };
  }
}

class LoadingCustom extends StatelessWidget {
  final Widget child;
  const LoadingCustom({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<LoadingProvider>(
            create: (context) => LoadingProvider(),
            builder: (context, _) {
              return Stack(children: [
                child,
                Consumer<LoadingProvider>(builder: (context, provider, child) {
                  return provider.loading ? Loader() : Container();
                })
              ]);
            }));
  }
}

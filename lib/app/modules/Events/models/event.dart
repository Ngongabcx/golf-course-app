// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
  Event({
    this.status,
    this.success,
    this.message,
    this.error,
    this.payload,
  });

  int? status;
  bool? success;
  String? message;
  String? error;
  List<Payload>? payload;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        status: json["status"],
        success: json["success"],
        message: json["message"],
        error: json["error"],
        payload:
            List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "message": message,
        "error": error,
        "payload": List<dynamic>.from(payload!.map((x) => x.toJson())),
      };
}

class Payload {
  Payload({
    this.id,
    this.name,
    this.description,
    this.location,
    this.from,
    this.to,
    this.fees,
    this.courseId,
  });

  int? id;
  String? name;
  String? description;
  String? location;
  DateTime? from;
  DateTime? to;
  List<Fee>? fees;
  int? courseId;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        location: json["location"],
        from: DateTime.parse(json["from"]),
        to: DateTime.parse(json["to"]),
        fees: List<Fee>.from(json["fees"].map((x) => Fee.fromJson(x))),
        courseId: json["courseId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "location": location,
        "from": from!.toIso8601String(),
        "to": to!.toIso8601String(),
        "fees": List<dynamic>.from(fees!.map((x) => x.toJson())),
        "courseId": courseId,
      };
}

class Fee {
  Fee({
    this.id,
    this.type,
    this.description,
    this.amount,
    this.eventId,
  });

  int? id;
  String? type;
  String? description;
  double? amount;
  int? eventId;

  factory Fee.fromJson(Map<String, dynamic> json) => Fee(
        id: json["id"],
        type: json["type"],
        description: json["description"],
        amount: json["amount"],
        eventId: json["eventId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "description": description,
        "amount": amount,
        "eventId": eventId,
      };
}

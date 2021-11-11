class Command {
  int id;
  String howTo;
  String line;

  Command({this.id, this.howTo, this.line});

  Command.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    howTo = json['howTo'];
    line = json['line'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['howTo'] = howTo;
    data['line'] = line;
    return data;
  }
}

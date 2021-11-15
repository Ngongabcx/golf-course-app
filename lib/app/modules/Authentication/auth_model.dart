class Auth {
  Info info;
  List<String> errors;
  bool success;

  Auth({this.info, this.errors, this.success});

  Auth.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    //errors = json['errors'].cast<String>();
     errors = json['errors'];
    success = json['success'];
  }

  Map<String, dynamic> toJson(decode) {
    final data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info.toJson();
    }
    data['errors'] = errors;
    data['success'] = success;
    return data;
  }
}

class Info {
  String accessToken;
  String refreshToken;

  Info({this.accessToken, this.refreshToken});

  Info.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}

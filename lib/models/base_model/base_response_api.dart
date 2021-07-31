class BaseResponseAPI {
  int? code;
  String? messages;
  dynamic data;

  BaseResponseAPI({this.code, this.messages, this.data});

  BaseResponseAPI.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messages = json['mess'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['messages'] = this.messages;
    data['data'] = this.data;
    return data;
  }
}

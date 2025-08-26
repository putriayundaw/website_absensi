import 'dart:convert';

class AuthResponseModel {
    final String? status;
    final String? uid;
    final String? message;

    AuthResponseModel({
        this.status,
        this.uid,
        this.message,
    });

    factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
        status: json["status"],
        uid: json["uid"],
        message: json["message"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "uid": uid,
        "message": message,
    };
}

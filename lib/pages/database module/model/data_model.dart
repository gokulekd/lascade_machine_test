// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    bool status;
    String message;
    dynamic error;
    List<Result> result;

    DataModel({
        required this.status,
        required this.message,
        required this.error,
        required this.result,
    });

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        status: json["status"],
        message: json["message"],
        error: json["error"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "error": error,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    String title;
    String description;
    String imageUrl;

    Result({
        required this.title,
        required this.description,
        required this.imageUrl,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        description: json["description"],
        imageUrl: json["image-url"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "image-url": imageUrl,
    };
}

// To parse this JSON data, do
//
//     final urlResult = urlResultFromJson(jsonString);

import 'dart:convert';

UrlResult urlResultFromJson(String str) => UrlResult.fromJson(json.decode(str));

String urlResultToJson(UrlResult data) => json.encode(data.toJson());

class UrlResult {
    UrlResult({
        this.resultUrl,
    });

    String resultUrl;

    factory UrlResult.fromJson(Map<String, dynamic> json) => UrlResult(
        resultUrl: json["result_url"],
    );

    Map<String, dynamic> toJson() => {
        "result_url": resultUrl,
    };
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class CallApi {
  static String getBaseUrl() {
    if (kDebugMode) {
      // 在调试模式下使用的基本 URL
      return 'http://192.168.0.178:8000/api';
    } else {
      // 在 release 模式下使用的基本 URL
      return 'http://192.168.0.178:8000/api';
    }
  }

  // static String getBaseUrl() {
  //   if (kDebugMode) {
  //     // 在调试模式下使用的基本 URL
  //     return 'http://192.168.0.80:44444/api';
  //   } else {
  //     // 在 release 模式下使用的基本 URL
  //     return 'http://192.168.20.20:8888/wos/api';
  //   }
  // }

  final String url;

  CallApi({this.url = ''});

  Future<Response> get(
      Map<String, dynamic> queryParams, Map<String, String> header) async {
    final String baseUrl = getBaseUrl();
    Uri uri = Uri.parse(baseUrl + url).replace(queryParameters: queryParams);
    debugPrint('準備GET: $uri');
    final response = await http.get(uri, headers: header);

    debugPrint('完成GET: $uri');

    // http 200，有接到伺服器的回應
    if (response.statusCode == 200) {
      var res = Response.fromJson(jsonDecode(response.body));
      return res;
    } else {
      debugPrint('烙賽');
      throw Exception('Failed to load album');
    }
  }

  Future<Response> post(dynamic reqBody, Map<String, String> header) async {
    final String baseUrl = getBaseUrl();

    debugPrint("當前網址：${baseUrl + url}");
    final body = jsonEncode(reqBody);
    final response =
        await http.post(Uri.parse(baseUrl + url), headers: header, body: body);

    // http 200，有接到伺服器的回應
    debugPrint('HTTP回傳狀態: ${response.statusCode}');
    if (response.statusCode == 200) {
      Response res = Response.fromJson(jsonDecode(response.body));
      return res;
    } else {
      debugPrint('烙賽');
      throw Exception('Failed to load album');
    }
  }
}

class Response {
  final int status;
  final dynamic data;
  final String msg;

  const Response({
    required this.status,
    required this.data,
    required this.msg,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      status: json['status'],
      data: json['data'],
      msg: json['msg'],
    );
  }
}

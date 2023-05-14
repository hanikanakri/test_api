import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:test1/api/api_handler.dart';

class HttpHandler {
  String url = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<ApiHandlerPhoto>> fetchData() async {
    List<ApiHandlerPhoto> myList = [];
    final respond = await http.get(Uri.parse(url));
    if (respond.statusCode == 200) {
      dynamic data = jsonDecode(respond.body);
      for (Map<String, dynamic> d in data) {
        ApiHandlerPhoto apiHandlerPhoto = ApiHandlerPhoto.fromJSON(d);
        myList.add(apiHandlerPhoto);
      }
      debugPrint(data.toString());
      return myList;
    } else {
      throw Exception('${respond.statusCode}');

    }
  }
}

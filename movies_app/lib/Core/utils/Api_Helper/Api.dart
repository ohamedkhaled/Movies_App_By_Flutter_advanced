import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class Api {

  Future<dynamic> Get({required String Url, @required String? Token}) async {
    Map<String, String> headers = {};
    if (Token != null) {
      headers.addAll({
        'Authorization': 'Bearer $Token'
      });
    }
    http.Response response = await http.get(Uri.parse(Url), headers: headers);

    if (response.statusCode == 200) {

       Map<String, dynamic>jsonData = jsonDecode(response.body) ;
      return  jsonData;
    } else {
      throw Exception('there is error and status:${response.body}');

    }
  }

  Future<dynamic> Post(
      {required String Url, @required dynamic body, @required String? Token}) async {
    Map<String, String> headers = {};
    if (Token != null) {
      headers.addAll({
        'Authorization': 'Bearer $Token'
      });
    }

    http.Response response = await http.post(
        Uri.parse(Url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      Exception(
          'there is error ${response.statusCode} with body ${response.body}');
    }
  }

  Future<dynamic> Put(
      {required String Url, @required dynamic body, @required String? Token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded'
    });

    if (Token != null) {
      headers.addAll({
        'Authorization': 'Bearer $Token'
      });
    }

    print('Url:$Url and body =$body and token= $Token');
    http.Response response = await http.put(
        Uri.parse(Url), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      Exception(
          'there is error ${response.statusCode} with body ${response.body}');
    }
  }

}


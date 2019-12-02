import 'dart:async';
import 'package:exampletododevindo/src/models/model_base.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;

class BaseApiProvider {
  Client client = Client();
  final _url = 'http://www.pakartanaman.com/skripsi/public';
  Future<BaseModels> fetchList() async {
    print('panggil data');
    final response = await client.get('$_url/list/rm');
    if (response.statusCode == 200) {
      // print(response.body.length);
      return compute(baseModelsFromJson, response.body);

      // return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<bool> addLogin(username, password) async {
    final response = await client
        .post("$_url/login/", body: {'userid': username, 'password': password});

    print('Username: ' + username + ' Password: ' + password + ' Response Code: ' + response.statusCode.toString());

    if (response.statusCode == 200) {
      print('Status Code 200');
      return true;
    } else {
      print('Gagal Login');
      return false;
      //throw Exception('Failed to Login');
    }
  }

  // Future updateList(ids) async {
  //   // print('$_url$ids/update');
  //   final response = await client.put("$_url$ids/update", body: {'done': "true"});
  //   if (response.statusCode == 200) {
  //     print('berhasil di update');
  //     return response;
  //   } else {
  //     throw Exception('Failed to update data');
  //   }
  // }
}

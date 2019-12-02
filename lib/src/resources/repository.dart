import 'dart:async';

import 'package:exampletododevindo/src/models/model_base.dart';
import 'package:exampletododevindo/src/resources/provider_base_api.dart';

class Repository{
  final baseApiProvider = BaseApiProvider();

  Future<BaseModels> fetchAllList() => baseApiProvider.fetchList();
  Future <bool> addLogin(String username, String password) => baseApiProvider.addLogin(username, password);
  // Future updateSaveTodo(String ids) => todoApiProvider.updateTodo(ids);
}
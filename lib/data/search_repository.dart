import 'dart:convert';

import 'package:flutter_application/shared/request.dart';
import 'package:http/http.dart' as http;

abstract class SearchRepository {
  Future<dynamic> getSavedSearch();
  Future<dynamic> getSearch(dynamic body);
  Future<dynamic> getSearchUser(dynamic body);
  Future<dynamic> deleteSearchById(String id);
  Future<dynamic> deleteSearchAll();
}

class SearchRepositoryImpl implements SearchRepository {
  @override
  Future<dynamic> getSavedSearch() async {
    var body = {"index": "0", "count": "10"};
    final http.Response response =
        await request('/get_saved_search', 'POST', isToken: true, body: body);
    Map<String, dynamic> data = json.decode(response.body);
    return data;
  }

  @override
  Future<dynamic> getSearch(dynamic body) async {
    final http.Response response =
        await request('/search', 'POST', isToken: true, body: body);
    Map<String, dynamic> data = json.decode(response.body);
    return data;
  }

  @override
  Future<dynamic> getSearchUser(dynamic body) async {
    final http.Response response =
        await request('/search_user', 'POST', isToken: true, body: body);
    Map<String, dynamic> data = json.decode(response.body);
    return data;
  }

  @override
  Future<dynamic> deleteSearchById(String id) async {
    var body = {"search_id": id};
    final http.Response response =
        await request('/del_saved_search', 'POST', isToken: true, body: body);
    Map<String, dynamic> data = json.decode(response.body);
    return data;
  }

  @override
  Future<dynamic> deleteSearchAll() async {
    var body = {"all": '1'};
    final http.Response response =
        await request('/del_saved_search', 'POST', isToken: true, body: body);
    Map<String, dynamic> data = json.decode(response.body);
    return data;
  }
}

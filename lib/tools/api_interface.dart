import '../models/item.dart';
import '../models/survey.dart';
import '../models/organisation.dart';
import '../models/profile.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiInterface {
  final String domain = 'http://10.0.2.2:8000';

  // Singleton pattern
  ApiInterface._internalConstructor();
  static final ApiInterface _instance = ApiInterface._internalConstructor();

  factory ApiInterface() {
    return _instance;
  }

  Future<bool> logIn(String username, String password) async {
    final uri = '$domain/api/account/login';
    var body = {
      'username': username,
      'password': password
    };

    return http.post(uri, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw("Http error");
      }
      var responseBody = json.decode(response.body);
      return responseBody['logged_in'];
    });
  }

  Future<bool> checkLoginStatus() async {
    final uri = '$domain/api/account/login';
    return http.get(uri).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw("Http error");
      }
      var responseBody = json.decode(response.body);
      return responseBody['logged_in'];
    });
  }

  Future<bool> logOut() async {
    final uri = '$domain/api/account/logout';
    return http.get(uri).then((http.Response response) {
      return true;
    });
  }

  bool signUp(String username, String password, String email) {
    return true;
  }

  Future<List<Survey>> getSurveys() async {
    final uri = '$domain/api/survey';
    return http.get(uri).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw("Http error");
      }
      var responseBody = json.decode(response.body);
      return responseBody['surveys'].map((surveyJson) => Survey.fromJson(surveyJson)).toList();
    });
  }

  Future<Survey> postSurvey(Survey survey) async {
    final uri = '$domain/api/survey';
    var body = {
      'description': survey.description,
      'type': survey.type,
      'survey_items': survey.surveyItems.map((surveyItem) {
        return {
          'notes': surveyItem.notes,
          'item_id': surveyItem.itemId
        };
      }).toList()
    };

    return http.post(uri, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw("Http error");
      }
      var responseBody = json.decode(response.body);
      return Survey.fromJson(responseBody['survey']);
    });
  }

  Future<List<Item>> getItems() async {
    final uri = '$domain/api/item';
    return http.get(uri).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw("Http error");
      }
      var responseBody = json.decode(response.body);
      return responseBody['items'].map((itemJson) => Item.fromJson(itemJson)).toList();
    });
  }

  Future<Profile> getProfile() async {
    final uri = '$domain/api/profile';
    return http.get(uri).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw("Http error");
      }
      var responseBody = json.decode(response.body);
      return Profile.fromJson(responseBody['profile']);
    });
  }

  Future<Organisation> getOrganisation() async {
    final uri = '$domain/api/organisation';
    return http.get(uri).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw("Http error");
      }
      var responseBody = json.decode(response.body);
      return Organisation.fromJson(responseBody['organisation']);
    });
  }
}
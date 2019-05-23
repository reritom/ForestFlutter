import '../models/item.dart';
import '../models/survey.dart';
import '../models/organisation.dart';
import '../models/profile.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiInterface {
  final String domain = 'http://reritom.pythonanywhere.com';
  List<Function> _loginCallbacks = [];

  // Singleton pattern
  ApiInterface._internalConstructor();
  static final ApiInterface _instance = ApiInterface._internalConstructor();

  factory ApiInterface() {
    return _instance;
  }

  void notifyLoginCallbacks() {
    print("Notifying login callbacks");
    for (var func in _loginCallbacks) {
      func();
    }
  }

  void onLogin(Function func) {
    print("Registering login callback");
    _loginCallbacks.add(func);
  }

  Future<bool> logIn(String username, String password) async {
    final uri = '$domain/api/account/login';
    var body = {
      'username': username,
      'password': password
    };

    print("Logging in");

    try {
      final response = await http.post(uri, body: body);
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        return false;
      }
      var responseBody = json.decode(response.body);
      print("Log in ${responseBody['logged_in']}");

      if (responseBody['logged_in']) {
        notifyLoginCallbacks();
      }
      return responseBody['logged_in'];
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> checkUsernameAvailability(String username) async {
    final uri = '$domain/api/ajax/username';
    var body = {
      'username': username
    };

    try {
      final response = await http.post(uri, body: body);
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw("Http error");
      }

      var responseBody = json.decode(response.body);
      return responseBody['available'];
    }
    catch (e) {
      return false;
    }
  }

  Future<bool> signUp(String username, String password, String email) async {
    final uri = '$domain/api/account/signup';
    var body = {
      'username': username,
      'password': password,
      'email': email
    };

    print("Signing up");

    final response = await http.post(uri, body: body);
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      throw("Http error");
    }
    notifyLoginCallbacks();
    return true;
  }

  Future<bool> checkLoginStatus() async {
    print("Checking login status");
    final uri = '$domain/api/account/login';

    try {
      final response = await http.get(uri);
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw("Http error");
      }
      var responseBody = json.decode(response.body);
      print("Logged in ${responseBody['logged_in']}");
      return responseBody['logged_in'];
    }
    catch (e) {
      return false;
    }
  }

  Future<dynamic> logOut() async {
    final uri = '$domain/api/account/logout';
    return http.get(uri).then((http.Response response) {
      return true;
    });
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

  Future<bool> deleteSurvey(Survey survey) async {
    final uri = '$domain/api/survey/${survey.id}';

    return http.delete(uri).then((http.Response response) {
      return true;
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

  Future<Item> postItem(Item item) async {
    final uri = '$domain/api/item';
    var body = {
      'description': item.description,
      'type': item.type,
      'external_id': item.externalId
    };

    return http.post(uri, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw("Http error");
      }
      var responseBody = json.decode(response.body);
      return Item.fromJson(responseBody['item']);
    });
  }

  Future<bool> deleteItem(Item item) async {
    final uri = '$domain/api/survey/${item.id}';

    return http.delete(uri).then((http.Response response) {
      return true;
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
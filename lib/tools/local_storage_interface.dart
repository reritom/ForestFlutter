import 'package:forestr/models/survey.dart';
import 'package:forestr/models/item.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocalStorageInterface {


  Future<String> getApiCookie() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('API_cookie') ?? null;
  }

  Future<bool> storeApiCookie(String cookie) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('API_cookie', cookie);
  }

  Future<String> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('username') ?? null;
  }

  Future<bool> storeUsername(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('username', username);
  }

  bool storeSurvey(Survey survey) {

  }

  List<Survey> getSurveys() {

  }

  void storeItem() {

  }

  List<Item> getItems() {

  }

  bool settingsAreStored() {
    return false;
  }

  Map<String, dynamic> readSettings() {
    return {};
  }
}
import 'package:forestr/models/survey.dart';
import 'package:forestr/models/item.dart';
import 'package:forestr/models/organisation.dart';
import 'package:forestr/models/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class LocalStorageInterface {

  Future<String> getApiCookie() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('API_cookie');
  }

  Future<bool> storeApiCookie(String cookie) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('API_cookie', cookie);
  }

  Future<String> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('username');
  }

  Future<bool> storeUsername(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('username', username);
  }

  Future<bool> storeSurvey(Survey survey) async {
    // We retrieve them first, append the new one, then store them again
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var existingSurveys = prefs.getStringList('surveys') ?? [];
    existingSurveys.add(json.encode(survey.toMap()));
    return prefs.setStringList('surveys', existingSurveys);
  }

  Future<List<Survey>> getSurveys() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var surveys = prefs.get('surveys') ?? [];
    surveys = surveys.map((surveyJson) => Survey.fromJson(surveyJson)).toList();
    return surveys;
  }

  Future<bool> cacheSurveys(List<Survey> surveys) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var encodedSurveys = surveys.map((survey) => json.encode(survey.toMap())).toList();
    return prefs.setStringList('cached_surveys', encodedSurveys);
  }

  Future<List<Survey>> getCachedSurveys() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var surveys = prefs.get('cached_surveys') ?? [];
    surveys = surveys.map((surveyJson) => Survey.fromJson(json.decode(surveyJson))).toList();
    return surveys;
  }

  Future<bool> storeItem(Item item) async {
    // We retrieve them first, append the new one, then store them again
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var existingItems = prefs.getStringList('items') ?? [];
    existingItems.add(json.encode(item.toMap()));
    return prefs.setStringList('items', existingItems);
  }

  Future<List<Item>> getItems() async {
    // We retrieve them first, append the new one, then store them again
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var items = prefs.get('items') ?? [];
    items = items.map((itemJson) => Item.fromJson(itemJson)).toList();
    return items;
  }

  Future<bool> cacheItems(List<Item> items) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var encodedItems = items.map((item) => json.encode(item.toMap())).toList();
    return prefs.setStringList('cached_items', encodedItems);
  }

  Future<List<Item>> getCachedItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var items = prefs.get('cached_items') ?? [];
    items = items.map((itemJson) => Item.fromJson(json.decode(itemJson))).toList();
    return items;
  }

  Future<bool> addSetting(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var existingSettings = prefs.getString('settings');
    var existingSettingsMap = json.decode(existingSettings);
    existingSettingsMap[key] = value;
    var newSettings = json.encode(existingSettingsMap);
    return prefs.setString('settings', newSettings);
  }

  Future<Map<String, dynamic>> getSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var settingsJson = prefs.getString('settings') ?? "{}";
    var settingsMap = json.decode(settingsJson);
    return settingsMap;
  }

  Future<bool> cacheProfile(Profile profile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('profile', json.encode(profile.toMap()));
  }

  Future<Profile> getCachedProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var profile = prefs.get('profile');
    if (profile != null) {
      profile = Profile.fromJson(json.decode(profile));
    }
    return profile;
  }

  Future<bool> cacheOrganisation(Organisation organisation) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('organisation', json.encode(organisation.toMap()));
  }

  Future<Organisation> getCachedOrganisation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var organisation = prefs.get('organisation');
    if (organisation != null) {
        organisation = Organisation.fromJson(json.decode(organisation));
    }
    return organisation;
  }
}
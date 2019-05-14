import 'package:forestr/models/item.dart';
import 'package:forestr/models/survey.dart';
import 'package:forestr/tools/api_interface.dart';
import 'package:forestr/tools/connection.dart';
import 'package:forestr/tools/bom_callback_mixin.dart';

class Bom with BomCallbackMixin{
  // Singleton logic
  Bom._internalConstructor() {
    // Read the API if it is available
    Connection().check().then((_) {
      ApiInterface().getSurveys().then((surveys) => apiSurveys = surveys);
      ApiInterface().getItems().then((items) => apiItems = items);
      }

    // Read the local models if there are any
    );
  }

  // Singleton pattern
  static final Bom _instance = Bom._internalConstructor();

  factory Bom() {
    return _instance;
  }

  // Bom internal items
  List<Survey> apiSurveys;
  List<Item> apiItems;

  List<Survey> stagedSurveys;
  List<Item> stagedItems;

  // Getter for merged items
  Future<List<Item>> getItems() async {
    var itemsList = [];
    itemsList.addAll(stagedItems);
    itemsList.addAll(apiItems);
    return itemsList;
  }

  // Getter for merged surveys
  Future<List<Survey>> getSurveys() async {
    var surveysList = [];
    surveysList.addAll(stagedSurveys);
    surveysList.addAll(apiSurveys);
    return surveysList;
  }

  bool validateExternalId(Item item) {
    return true;
  }

  void addItem(Item item) {
    if (validateExternalId(item)) {
      ApiInterface().postItem(item).then((_) => callbackItemListeners());
    }
  }
  /*
  void updateItem(Item item) {
    if (validateExternalId(item)) {
      ApiInterface().patchItem(item).then((_) => callbackItemListeners());
    }
  }
  */

  void deleteItem(Item item) {
    ApiInterface().deleteItem(item).then((_) => callbackItemListeners());
  }

  void addSurvey(Survey survey) {
    ApiInterface().postSurvey(survey).then((_) => callbackSurveyListeners());
  }

  /*
  void updateSurvey(Survey survey) {
    ApiInterface().patchSurvey(survey).then((_) => callbackSurveyListeners());
  }
  */

  void deleteSurvey(Survey survey) {
    ApiInterface().deleteSurvey(survey).then((_) => callbackSurveyListeners());
  }

  bool checkConnection() {
    return true;
  }

}
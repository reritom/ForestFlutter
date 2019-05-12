import 'package:forestr/models/item.dart';
import 'package:forestr/models/survey.dart';
import 'package:forestr/tools/api_interface.dart';
import 'package:forestr/tools/connection.dart';

class Bom {
  // Singleton logic
  Bom._internalConstructor() {
    // Read the API if it is available
    Connection().check().then((_) {
      ApiInterface().getSurveys().then((surveys) => apiSurveys = surveys);
      ApiInterface().getItems().then((items) => apiItems = items);
      }
    );
  }

  // Singleton pattern
  static final Bom _instance = Bom._internalConstructor();

  factory Bom() {
    return _instance;
  }

  // Bom internal items (though publicly accessibly for synchro)
  List<Survey> apiSurveys;
  List<Item> apiItems;

  List<Survey> stagedSurveys;
  List<Item> stagedItems;

  // Getter for merged items
  List<Item> get items {
    var itemsList = [];
    itemsList.addAll(stagedItems);
    itemsList.addAll(apiItems);
    return itemsList;
  }

  // Getter for merged surveys
  List<Item> get surveys {
    var surveysList = [];
    surveysList.addAll(stagedSurveys);
    surveysList.addAll(apiSurveys);
    return surveysList;
  }

  void addItem(Item item) {

  }

  void updateItem(Item item) {

  }

  void deleteItem(Item item) {

  }

  void addSurvey(Survey survey) {

  }

  void updateSurvey(Survey survey) {

  }

  void deleteSurvey(Survey survey) {

  }

  bool checkConnection() {
    return true;
  }

}
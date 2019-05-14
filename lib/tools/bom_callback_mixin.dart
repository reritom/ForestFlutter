class BomCallbackMixin {
  // Bom extension to allow callbacks to subscribers on given events
  // Will be replaced by streams

  List<Function> itemListenerCallbacks = [];
  List<Function> surveyListenerCallbacks = [];

  void onSurveysChange(Function func) {
    surveyListenerCallbacks.add(func);
  }

  void onItemsChange(Function func) {
    itemListenerCallbacks.add(func);
  }

  void callbackSurveyListeners() {
    for (var callback in surveyListenerCallbacks) {
      callback();
    }
  }

  void callbackItemListeners() {
    for (var callback in itemListenerCallbacks) {
      callback();
    }
  }
}
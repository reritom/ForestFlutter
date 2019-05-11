import 'survey_item.dart';

class Survey {
  String id;
  String created;
  String description;
  String type;
  List<SurveyItem> surveyItems;

  Survey({
    this.id,
    this.created,
    this.description,
    this.type,
    this.surveyItems = const <SurveyItem>[]
  });

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      id: json['id'],
      created: json['created'],
      description: json['description'],
      type: json['type'],
      surveyItems: json['survey_items'].map((surveyItemJson) => SurveyItem.fromJson(surveyItemJson)).toList(),
    );
  }

  void addSurveyItem(SurveyItem item) {
    surveyItems.add(item);
  }
}

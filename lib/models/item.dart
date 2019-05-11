class Item {
  String id;
  String created;
  String description;
  Map<String, String> surveyHistory;

  // Meta
  var updated = false;

  Item({
    this.id,
    this.created,
    this.description,
    this.surveyHistory
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      created: json['created'],
      description: json['description'],
      surveyHistory: json['survey_history']
    );
  }

}
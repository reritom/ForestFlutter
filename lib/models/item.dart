class Item {
  String id;
  String created;
  String description;
  String type;
  String externalId;
  Map<String, String> surveyHistory;

  // Meta
  var updated = false;

  Item({
    this.id,
    this.created,
    this.description,
    this.type,
    this.externalId,
    this.surveyHistory
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      created: json['created'],
      description: json['description'],
      type: json['type'],
      externalId: json['external_id'],
      surveyHistory: json['survey_history']
    );
  }

}
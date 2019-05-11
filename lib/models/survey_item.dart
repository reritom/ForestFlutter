class SurveyItem {
  String id;
  String created;
  String notes;
  String itemId;

  SurveyItem({
    this.id,
    this.created,
    this.notes,
    this.itemId
  });

  factory SurveyItem.fromJson(Map<String, dynamic> json) {
    return SurveyItem(
      id: json['id'],
      created: json['created'],
      notes: json['notes'],
      itemId: json['item_id']
    );
  }
}

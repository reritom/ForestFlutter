class Organisation {
  String id;
  String name;
  String description;
  bool enterprise;
  bool personal;
  bool publiclySearchable;

  Organisation({
    this.id,
    this.name,
    this.description,
    this.enterprise,
    this.personal,
    this.publiclySearchable
  });

  factory Organisation.fromJson(Map<String, dynamic> json) {
    return Organisation(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      enterprise: json['enterprise'],
      personal: json['personal'],
      publiclySearchable: json['publicly_searchable']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'description': this.description,
      'enterprise': this.enterprise,
      'personal': this.personal,
      'publicly_searchable': this.publiclySearchable
    };
  }
}
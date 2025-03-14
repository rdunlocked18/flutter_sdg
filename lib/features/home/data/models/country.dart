class Country {
  final int? id;
  final String? value;

  Country({
    this.id,
    this.value,
  });

  Country.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        value = json['value'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'value': value};
}

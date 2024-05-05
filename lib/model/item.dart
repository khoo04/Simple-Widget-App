class Item {
  final String name;
  final bool completeStatus;

  Item({required this.name, required this.completeStatus});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(name: json["name"], completeStatus: json["completeStatus"]);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "completeStatus": completeStatus};
  }
}

class items {
  final String category;
  final String item_name;
  final int id;
  final String quantity;
  final DateTime date;
  items(
      {required this.id,
      required this.category,
      required this.item_name,
      required this.quantity,
      required this.date});

  factory items.fromJson(Map<String, dynamic> json) {
    return items(
        id: json['id'],
        category: json['category'],
        item_name: json['item_name'],
        quantity: json['quantity'],
        date: json['added_on']);
  }
}

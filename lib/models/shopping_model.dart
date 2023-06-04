class ShoppingModel {
  int id, quantity;
  double price;
  String title, description, image;

  ShoppingModel({
    required this.id,
    required this.quantity,
    required this.price,
    required this.title,
    required this.image,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "quantity": quantity,
      "price": price,
      "title": title,
      "description": description,
      "image": image,
    };
  }

  static ShoppingModel fromSnap(dynamic snap) {
    return ShoppingModel(
        id: snap["id"],
        quantity: snap["quantity"],
        price: snap["price"] * 1.00,

        /// if the value is integer type, it will be double type
        image: snap["image"],
        description: snap["description"],
        title: snap["title"]);
  }
}

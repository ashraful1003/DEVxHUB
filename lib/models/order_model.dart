class OrderModel {
  int id, quantity;
  double price;
  String title, description, image;

  OrderModel({
    required this.id,
    required this.quantity,
    required this.price,
    required this.title,
    required this.image,
    required this.description,
  });
}

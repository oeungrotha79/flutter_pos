class Product {
  int id;
  String name;
  String description;
  double price;
  String image;
  List<String> images;
  String? nutrition;
  double? rating;
  bool _isFavorite = false;
  int _quantity =1;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.images = const [],
    this.nutrition,
    this.rating,
  });

  bool get isFavorite => _isFavorite;
  int get quantity => _quantity;
  void toggleProduct()=> _isFavorite = !isFavorite;
  void increaseQty()=> _quantity ++;
  void decreaseQty() {
    if(quantity > 1){
      _quantity --;
    }
  }

  void rate(double value) => rating = value;

}
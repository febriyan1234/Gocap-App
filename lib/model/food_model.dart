class FoodModel {
  final String image;
  final String name;
  final String distance;
  final double rating;
  final String promo;
  final bool isAds;

  FoodModel({
    required this.image,
    required this.name,
    required this.distance,
    required this.rating,
    required this.promo,
    required this.isAds,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      image: json["image"], 
      name: json["name"], 
      distance: json["distance"], 
      rating: json["rating"], 
      promo: json["promo"], 
      isAds: json["isAds"],
    );
  }
}
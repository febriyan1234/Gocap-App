class PromoModel {
  final String image;
  final String title;

  PromoModel({
    required this.image,
    required this.title,
  });

  factory PromoModel.fromJson(Map<String, dynamic> json) {
    return PromoModel(
      image: json["image"], 
      title: json["title"],
    );
  }
}
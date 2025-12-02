class StoreModel{
  final String name;
  final String description;
  final String image;

  StoreModel({
    required this.name,
    required this.description,
    required this.image,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      name: json["name"], 
      description: json["description"], 
      image: json["image"],
    );
  }
}
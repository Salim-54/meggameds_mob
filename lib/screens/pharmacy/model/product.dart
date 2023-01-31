class Product {
  String id;
  String medName;
  String medComment;
  String medNumber;
  String medPrice;

  String medPicture;

  Product({
    required this.id,
    required this.medName,
    required this.medComment,
    required this.medNumber,
    required this.medPrice,
    required this.medPicture,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'].toString(),
      medName: json['medName'],
      medComment: json['medComment'],
      medNumber: json['medNumber'].toString(),
      medPrice: json['medPrice'].toString(),
      medPicture: json['medPicture'],
    );
  }
}

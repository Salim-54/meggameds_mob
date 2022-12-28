class Payment {
  String id;
  int token;
  String payment;
  String type;

  Payment({
    required this.id,
    required this.token,
    required this.payment,
    required this.type,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['_id'].toString(),
      token: json['token'],
      payment: json['payment'],
      type: json['type'].toString(),
    );
  }
}

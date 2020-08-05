class Transaction {
  int id;
  String category;
  num amount;
  String date;
  String description;

  Transaction(
      {this.id, this.category, this.amount, this.date, this.description});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as num,
      category: json['category'] as String,
      amount: json['amount'] as num,
      date: json['made_on'] as String,
      description: json['description'] as String,
    );
  }
}

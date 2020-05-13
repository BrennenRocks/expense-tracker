class Transaction {
  final String id;
  final String text;
  final double amount;

  Transaction({this.id, this.text, this.amount});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['_id'],
      text: json['text'],
      amount: json['amount'].toDouble(),
    );
  }

  @override
  bool operator ==(other) {
    return this.id == other.id;
  }

  @override
  int get hashCode => super.hashCode;
}

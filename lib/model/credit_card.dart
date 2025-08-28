class CreditCard {
  final String number;
  final String flag;

  const CreditCard({required this.number, required this.flag});

  Map<String, Object?> toMap() {
    return {'number': number, 'flag': flag};
  }
}

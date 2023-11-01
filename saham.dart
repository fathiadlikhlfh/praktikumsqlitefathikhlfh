class Saham {
  final int? tickerId;
  final String ticker;
  final int? open;
  final int? high;
  final int? last;
  final String? change;

  Saham({
    this.tickerId,
    required this.ticker,
    this.open,
    this.high,
    this.last,
    this.change,
  });

  Map<String, dynamic> toMap() {
    return {
      'tickerid': tickerId,
      'ticker': ticker,
      'open': open,
      'high': high,
      'last': last,
      'change': change,
    };
  }

  factory Saham.fromMap(Map<String, dynamic> map) {
    return Saham(
      tickerId: map['tickerid'],
      ticker: map['ticker'],
      open: map['open'],
      high: map['high'],
      last: map['last'],
      change: map['change'],
    );
  }
}

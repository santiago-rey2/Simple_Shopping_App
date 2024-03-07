import 'dart:convert';

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  @override
  String toString() => 'Rating(rate: $rate, count: $count)';

  factory Rating.fromJson1(Map<String, dynamic> data) {
    return Rating(
      rate: (data['rate'] as num?)?.toDouble(),
      count: data['count'] as int?,
    );
  }

  Map<String, dynamic> toJson1() {
    return {
      'rate': rate,
      'count': count,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Rating].
  factory Rating.fromJson(String data) {
    return Rating.fromJson1(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Rating] to a JSON string.
  String toJson() => json.encode(toJson1());

  Rating copyWith({
    double? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }
}

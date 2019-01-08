class Fact {
  String text;
  String updatedAt;

  Fact({
    this.text,
    this.updatedAt,
  });

  Fact.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

  @override
  String toString() => "$text - $updatedAt";
}

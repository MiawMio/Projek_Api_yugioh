class YugiohCard {
  final String name;
  final String type;
  final String desc;
  final String imageUrl;

  YugiohCard({
    required this.name,
    required this.type,
    required this.desc,
    required this.imageUrl,
  });

  factory YugiohCard.fromJson(Map<String, dynamic> json) {
    return YugiohCard(
      name: json['name'],
      type: json['type'],
      desc: json['desc'],
      imageUrl: json['card_images'][0]['image_url'],
    );
  }
}

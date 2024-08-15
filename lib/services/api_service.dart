import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/yugioh_card.dart';

class ApiService {
  final String baseUrl = 'https://db.ygoprodeck.com/api/v7/cardinfo.php';

  Future<List<YugiohCard>> fetchCards({String? query}) async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> cardsData = jsonData['data'];

      List<YugiohCard> cards =
          cardsData.map((json) => YugiohCard.fromJson(json)).toList();

      if (query != null && query.isNotEmpty) {
        cards = cards
            .where(
                (card) => card.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }

      return cards;
    } else {
      throw Exception('Failed to load cards');
    }
  }
}

import 'package:flutter/material.dart';
import '../models/yugioh_card.dart';
import '../services/api_service.dart';

class CardProvider with ChangeNotifier {
  List<YugiohCard> _cards = [];
  bool _isLoading = false;
  String? _error;

  List<YugiohCard> get cards => _cards;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchCards({String? query}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _cards = await ApiService().fetchCards(query: query);
    } catch (e) {
      _error = 'Failed to load cards';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

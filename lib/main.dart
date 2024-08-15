import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/card_provider.dart';
import 'widgets/card_widget.dart';
import 'screens/card_detail_screen.dart';
import 'screens/splash_screen.dart'; // Pastikan file ini ada

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CardProvider(),
      child: MaterialApp(
        title: 'Yu-Gi-Oh! Cards',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            SplashToCardListScreen(), // Menampilkan splash screen terlebih dahulu
      ),
    );
  }
}

class CardListScreen extends StatefulWidget {
  @override
  _CardListScreenState createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<CardProvider>(context, listen: false).fetchCards();
  }

  void _onSearchChanged() {
    Provider.of<CardProvider>(context, listen: false)
        .fetchCards(query: _searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Yu-Gi-Oh! Cards'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search cards',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => _onSearchChanged(),
            ),
          ),
          Expanded(
            child: provider.isLoading
                ? Center(child: CircularProgressIndicator())
                : provider.error != null
                    ? Center(child: Text(provider.error!))
                    : ListView.builder(
                        padding: EdgeInsets.all(8.0),
                        itemCount: provider.cards.length,
                        itemBuilder: (context, index) {
                          final card = provider.cards[index];
                          return CardWidget(
                            card: card,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CardDetailScreen(card: card),
                                ),
                              );
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

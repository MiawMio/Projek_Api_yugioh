import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/card_provider.dart';
import 'widgets/card_widget.dart';
import 'screens/card_detail_screen.dart';

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
        title: Text(
          'Yu-Gi-Oh!',
          style: TextStyle(
              color: Colors.white), // Mengubah warna teks menjadi putih
        ),
        backgroundColor:
            Color.fromARGB(255, 0, 0, 0), // Warna latar belakang AppBar
        elevation: 0, // Menghilangkan bayangan AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurpleAccent,
              Color.fromARGB(255, 253, 252, 253)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search cards',
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(
                        255, 249, 249, 250), // Warna teks label
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.white, // Warna border menjadi putih
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color:
                          Colors.white, // Warna border saat fokus menjadi putih
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color:
                        const Color.fromARGB(255, 255, 254, 255), // Warna ikon
                  ),
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
      ),
    );
  }
}

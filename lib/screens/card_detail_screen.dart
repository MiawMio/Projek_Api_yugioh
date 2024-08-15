import 'package:flutter/material.dart';
import '../models/yugioh_card.dart';

class CardDetailScreen extends StatelessWidget {
  final YugiohCard card;

  const CardDetailScreen({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          card.name,
          style: TextStyle(
              color: Colors.white), // Mengubah warna teks menjadi putih
        ),
        backgroundColor: Colors.deepPurple, // Warna latar belakang AppBar
      ),
      body: SingleChildScrollView(
        // Membungkus dengan SingleChildScrollView agar bisa di-scroll
        child: Container(
          color:
              Color.fromARGB(255, 245, 245, 245), // Warna latar belakang layar
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(10.0), // Sudut gambar melengkung
                child: Image.network(
                  card.imageUrl,
                  fit: BoxFit.cover,
                  height: 500,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 20),
              Text(
                card.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple, // Warna teks
                ),
              ),
              SizedBox(height: 10),
              Text(
                card.type,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.deepPurple[300], // Warna teks
                ),
              ),
              SizedBox(height: 20),
              Text(
                card.desc,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(221, 0, 0, 0), // Warna teks deskripsi
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

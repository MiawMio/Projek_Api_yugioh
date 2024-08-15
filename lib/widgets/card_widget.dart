import 'package:flutter/material.dart';
import '../models/yugioh_card.dart';

class CardWidget extends StatelessWidget {
  final YugiohCard card;
  final VoidCallback onTap;

  const CardWidget({Key? key, required this.card, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8.0, // Menambahkan elevasi untuk efek bayangan
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Sudut kartu melengkung
        ),
        color: Color.fromARGB(255, 3, 5, 5), // Warna latar belakang kartu
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  card.imageUrl,
                  height: 120,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(
                            255, 255, 255, 255), // Warna teks nama kartu
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      card.type,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(
                            255, 255, 255, 255), // Warna teks tipe kartu
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

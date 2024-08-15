import 'package:flutter/material.dart';
import '../CardListScreen.dart';

class SplashToCardListScreen extends StatefulWidget {
  @override
  _SplashToCardListScreenState createState() => _SplashToCardListScreenState();
}

class _SplashToCardListScreenState extends State<SplashToCardListScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToCardListScreen();
  }

  _navigateToCardListScreen() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CardListScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/yugioh_logo.png',
                height:
                    150), // Pastikan Anda memiliki gambar ini di folder assets
            SizedBox(height: 20),
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              'Yu-Gi-Oh! Cards',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

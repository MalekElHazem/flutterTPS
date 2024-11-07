import 'package:flutter/material.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number to Words',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NumberToWordsPage(),
    );
  }
}

class NumberToWordsPage extends StatefulWidget {
  @override
  _NumberToWordsPageState createState() => _NumberToWordsPageState();
}

class _NumberToWordsPageState extends State<NumberToWordsPage> {
  final TextEditingController _controller = TextEditingController();
  String _convertedText = "";

  // Méthode pour convertir le texte en arabe avec une gestion des virgules
  void _convertToArabic() {
    String input = _controller.text;
    if (input.isNotEmpty) {
      try {
        double? number =
            double.tryParse(input); // Tentative de conversion en nombre
        if (number != null) {
          setState(() {
            // Séparer la partie entière et la partie décimale
            List<String> parts = input.split('.');
            String integerPart = parts[0];
            String decimalPart = parts.length > 1 ? parts[1] : "";

            // Traiter la partie décimale en ajoutant des zéros si nécessaire
            if (decimalPart.length == 1) {
              decimalPart = decimalPart + "00"; // Ajouter deux zéros
            } else if (decimalPart.length == 2) {
              decimalPart = decimalPart + "0"; // Ajouter un zéro
            } else if (decimalPart.length > 3) {
              decimalPart = decimalPart.substring(0, 3); // Limiter à 3 chiffres
            }

            // Convertir la partie entière en mots
            String integerWords = Tafqeet.convert(integerPart);

            // Convertir la partie décimale si elle existe
            String decimalWords = decimalPart.isNotEmpty
                ? "و ${Tafqeet.convert(decimalPart)} مليم"
                : "";

            // Construire la chaîne finale avec "دينار"
            _convertedText = "$integerWords دينار $decimalWords";
          });
        } else {
          setState(() {
            _convertedText = "Invalid input!";
          });
        }
      } catch (e) {
        setState(() {
          _convertedText = "Invalid input!";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number to Words'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Workshop 2',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter number',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertToArabic,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // Couleur du bouton
                foregroundColor: Colors.black, // Couleur du texte
              ),
              child: Text('Convert to Arabic'),
            ),
            SizedBox(height: 20),
            if (_convertedText.isNotEmpty)
              Text(
                _convertedText,
                textDirection: TextDirection.rtl, // Afficher le texte en arabe
                style: TextStyle(fontSize: 24, color: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }
}

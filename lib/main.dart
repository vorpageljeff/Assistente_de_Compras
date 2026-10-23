import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() {
  runApp(AssistenteComprasApp());
}

class AssistenteComprasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assistente de Compras com IA',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String _recomendacao = "";

  Future<void> _consultarIA() async {
    const apiKey = String.fromEnvironment('GEMINI_API_KEY');
    if (apiKey.isEmpty) {
      setState(() {
        _recomendacao = 'Configure GEMINI_API_KEY antes de consultar a IA.';
      });
      return;
    }

    final model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
    );

    final prompt = _controller.text;

    try {
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      setState(() {
        _recomendacao = response.text ?? 'Sem resposta da IA.';
      });
    } catch (e) {
      setState(() {
        _recomendacao = 'Erro: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assistente de Compras IA")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Descreva o que você precisa comprar:"),
            TextField(controller: _controller),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: _consultarIA,
              child: Text("Obter Recomendações"),
            ),
            SizedBox(height: 24),
            Text("Sugestões:", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(_recomendacao),
          ],
        ),
      ),
    );
  }
}

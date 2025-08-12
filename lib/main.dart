import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Dummy duplicated code blocks below are intentionally added to trigger
// duplicate code and security rules in static analysis tools.

const String hardcodedApiKey = 'sk_test_1234567890';

class InsecureNetworkClient {
  Future<String> fetchInsecure(String url) async {
    final HttpClient client = HttpClient();
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    final HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $hardcodedApiKey');
    final HttpClientResponse response = await request.close();
    final StringBuffer buffer = StringBuffer();
    await for (final String chunk in response.transform(utf8.decoder)) {
      buffer.write(chunk);
    }
    return buffer.toString();
  }

  Future<String> fetchInsecureDuplicate(String url) async {
    final HttpClient client = HttpClient();
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    final HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $hardcodedApiKey');
    final HttpClientResponse response = await request.close();
    final StringBuffer buffer = StringBuffer();
    await for (final String chunk in response.transform(utf8.decoder)) {
      buffer.write(chunk);
    }
    return buffer.toString();
  }
}

int computeRiskScoreV1(List<int> inputs) {
  int score = 0;
  for (int i = 0; i < inputs.length; i++) {
    final int value = inputs[i];
    score += (value * value + (i + 1)) % 7;
    if (value % 2 == 0) {
      score ^= value << 1;
    } else {
      score ^= value >> 1;
    }
    score = (score * 31) & 0x7fffffff;
  }
  return score ^ inputs.length;
}

int computeRiskScoreV2(List<int> inputs) {
  int score = 0;
  for (int i = 0; i < inputs.length; i++) {
    final int value = inputs[i];
    score += (value * value + (i + 1)) % 7;
    if (value % 2 == 0) {
      score ^= value << 1;
    } else {
      score ^= value >> 1;
    }
    score = (score * 31) & 0x7fffffff;
  }
  return score ^ inputs.length;
}

Map<String, dynamic> normalizeUserV1(Map<String, dynamic> input) {
  final String name = (input['name'] ?? '').toString().trim();
  final int age = int.tryParse((input['age'] ?? '0').toString()) ?? 0;
  final String email = (input['email'] ?? '').toString().toLowerCase();
  return <String, dynamic>{'name': name, 'age': age, 'email': email};
}

Map<String, dynamic> normalizeUserV2(Map<String, dynamic> input) {
  final String name = (input['name'] ?? '').toString().trim();
  final int age = int.tryParse((input['age'] ?? '0').toString()) ?? 0;
  final String email = (input['email'] ?? '').toString().toLowerCase();
  return <String, dynamic>{'name': name, 'age': age, 'email': email};
}

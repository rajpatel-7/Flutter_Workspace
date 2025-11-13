import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = "bcaec620618d0a713c130b765258add4"; 

void main() {
  runApp(const MovieSearchApp());
}

class MovieSearchApp extends StatelessWidget {
  const MovieSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieSearchScreen(),
    );
  }
}

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  _MovieSearchScreenState createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  Map<String, dynamic>? movieData;
  bool isLoading = false;

  Future<void> fetchMovie(String movieTitle) async {
    setState(() => isLoading = true);

    final url = "https://www.omdbapi.com/?t=$movieTitle&apikey=$apiKey";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        movieData = data['Response'] == "True" ? data : null;
        isLoading = false;
      });
    } else {
      setState(() {
        movieData = null;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie Search")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter movie title",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    fetchMovie(_controller.text.trim());
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (isLoading)
              const CircularProgressIndicator()
            else if (movieData != null)
              Expanded(
                child: ListView(
                  children: [
                    if (movieData!['Poster'] != "N/A")
                      Image.network(movieData!['Poster']),
                    const SizedBox(height: 10),
                    Text(
                      movieData!['Title'] ?? "No Title",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Year: ${movieData!['Year'] ?? 'N/A'}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Genre: ${movieData!['Genre'] ?? 'N/A'}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Director: ${movieData!['Director'] ?? 'N/A'}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Plot: ${movieData!['Plot'] ?? 'N/A'}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            else
              const Text("No movie found", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}


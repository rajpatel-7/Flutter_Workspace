import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Data loaded successfully:\n');
      for (var item in data.take(5)) {
        print('Title: ${item['title']}');
      }
    } else {
      print('Failed to load data. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred while fetching data: $e');
  }
}

void main() {
  fetchData();
}

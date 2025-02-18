```dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonData.containsKey('key')) {
        return jsonData;
      } else {
        print('Error: Key not found in JSON response.');
        return null; // Or throw a custom exception
      }
    } else if (response.statusCode == 404) {
      print('Error: API endpoint not found (404)');
      return null;
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } on SocketException {
    print('Error: No internet connection');
    return null;
  } on FormatException {
    print('Error: Invalid JSON format');
    return null;
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
```
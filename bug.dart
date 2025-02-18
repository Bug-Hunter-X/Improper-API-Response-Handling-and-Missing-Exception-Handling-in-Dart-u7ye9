```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the data here
      final jsonData = jsonDecode(response.body);
      // Accessing data incorrectly. Assuming jsonData is a Map, but could be a List or something else.
      final value = jsonData['key']; // Error prone. what if 'key' is missing?
      print(value);
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    //No proper error handling for the various exception types that can occur, like SocketException, FormatException, etc.
  }
}
```
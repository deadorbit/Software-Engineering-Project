import 'dart:convert';
import 'package:http/http.dart' as http;

class APIManipulation {
  // Constructor (can be omitted if not needed)
  APIManipulation();

  Future<List<Map<String, dynamic>>> getOneDayJson(String stockCode) async {
    try {
      var resp = await http
          .get(Uri.parse('http://10.0.2.2:8000/stock/$stockCode/time/1d'));
      print(resp.body);

      if (resp.statusCode == 200) {
        print("yes");
        var jsonData = jsonDecode(resp.body) as List; // Cast directly to List
        return jsonData
            .map<Map<String, dynamic>>((e) => e as Map<String, dynamic>)
            .toList();
      } else {
        print('Server error: ${resp.statusCode}');
        return [{}];
      }
    } on http.ClientException catch (e) {
      print('HTTP error: $e');
      return [{}];
    } on FormatException catch (e) {
      print('JSON Format error: $e');
      return [{}];
    } catch (e) {
      print('Unknown error: $e');
      return [{}];
    }
  }
}

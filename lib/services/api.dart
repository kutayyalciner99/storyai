import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<String?> fetchDalleImageUrl(String prompt) async {
    final uri = Uri.parse('https://api.deepai.org/api/text2img');
    final headers = {
      'api-key': '1012c4ea-949e-4a8e-b4eb-460ac48b9ffe',
    };
    var body = {"text": prompt, "grid_size": "1"};

    try {
      final response = await http.post(uri, headers: headers, body: body);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        final imageUrl =
            responseBody.isNotEmpty ? responseBody['output_url'] : null;
        return imageUrl is String ? imageUrl : null;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      Future.error(e);
    }
    return null;
  }
}

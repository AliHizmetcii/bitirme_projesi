import 'dart:convert';
import 'package:http/http.dart' as http;

  Future  getStats() async {
    Map valueMap= {'key1':1,'key2':2};
    // ignore: deprecated_member_use
    var request = http.Request(
      'GET',
      Uri.parse(""),
    );
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      valueMap = json.decode(await response.stream.bytesToString());
    }
    return valueMap;
  }

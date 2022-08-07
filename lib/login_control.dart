import 'package:http/http.dart' as http;
import 'package:bitirme_projesi/login.dart';

class loginControl {

  final username="";
  final password="";

  Future<String> getData() async {
    var request = http.Request(
      'GET',
      Uri.parse(""),
    );
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      if(username==Login().usernameController && password==Login().passwordController){
        
      }
    }
    return "stats";
  }
}
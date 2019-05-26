import 'dart:convert';
import 'package:http/http.dart';
import 'fact.dart';

Future<Fact> randomFact() async {  
  var response = await get('https://cat-fact.herokuapp.com/facts/random');
  
  if (response.statusCode == 200) {
    return Fact.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to fetch a random animal fact!");
  }  
}
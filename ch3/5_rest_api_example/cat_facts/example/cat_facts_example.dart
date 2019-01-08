import 'package:cat_facts/cat_facts.dart';

main() async {
  var fact = await randomFact();
  print("Did you know?\n$fact");
}

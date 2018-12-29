/**
 * Callable classes example
 */
class ShouldWriteAProgram { // this is simple class 
  String language;
  String platform;

  ShouldWriteAProgram(this.language, this.platform);

  bool call(String category) {
    if(language == "Dart" && platform == "Flutter") {
      return category != "todo";
    } 
    return false;
  }
 }

main() {
  var shouldWrite = ShouldWriteAProgram("Dart", "Flutter");
    
  print(shouldWrite("todo")); // Another todo list app? no thanks.

  Function shouldWriteFunction = shouldWrite;
  print(shouldWriteFunction("todo")); // same result
  
}


main() {
  var a;

  try {
    a.doSomething();   
  } on NoSuchMethodError {
    print("'a' variable does not have the doSomething() method ");
  }
}
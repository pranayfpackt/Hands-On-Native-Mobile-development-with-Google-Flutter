
main() {
  var a;

  try {
    a.doSomething();   
  } on NoSuchMethodError catch (e, s) {
    print("'a' variable does not have the doSomething() method:");
  } finally {
    print("end of the block");
  }
}
/**
 * Class static members example
 */
class Person {
  static String personLabel = "Person name:";

  String firstName;
  String lastName;

  String get fullName => "$personLabel $firstName $lastName";
  
  Person(this.firstName, this.lastName);
}

main() {
  Person somePerson = Person("clark", "kent");
  Person anotherPerson  = Person("peter", "park");

  print(somePerson.fullName); // prints Person name: clark kent
  print(anotherPerson.fullName); // prints Person name: peter park

  Person.personLabel = "name:";

  print(somePerson.fullName); // prints name: clark kent
  print(anotherPerson.fullName); // prints name: peter park
}

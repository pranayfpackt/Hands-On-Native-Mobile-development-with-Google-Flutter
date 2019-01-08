/**
 * Person libary definition
 */
export 'programmer.dart';
export 'student.dart';

class Person {
  String firstName;
  String lastName;
  PersonType _type;

  Person({this.firstName, this.lastName, PersonType type}) {
    _type = type;
  }

  String toString() => "($_type): $firstName $lastName";
}

enum PersonType { student, employee }
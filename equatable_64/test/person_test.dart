import 'package:equatable_64/person.dart';

void main() {
  Person p = Person(name: "Razzi", age: 26);

  if (p == Person(name: "Razzi", age: 26)) {
    print("Sama");
  } else {
    print("tidak sama");
  }

  List<Person> persons = [p];
  if (persons.contains(Person(name: "Razzi", age: 26))) {
    print("Ada");
  } else {
    print("tidak ada");
  }
}

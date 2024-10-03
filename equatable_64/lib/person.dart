import 'package:equatable/equatable.dart';

class BasePerson {}

// ignore: must_be_immutable
class Person extends BasePerson with EquatableMixin {
  String? name;
  int? age;

  Person({this.name, this.age});

  @override
  // TODO: implement props
  List<Object?> get props => [name, age];

  // @override
  // bool operator ==(Object other) {
  //   if (other is Person) {
  //     if (name == other.name && age == other.age) {
  //       return true;
  //     }
  //   }

  //   return false;
  // }
}

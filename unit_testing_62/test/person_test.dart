import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing_62/person.dart';

void main() {
  group("Mengecek class Person", () {
    Person p;
    p = Person();
    test("Inisialisasi Objek Person", () {
      expect(p.name, equals("no name"));
      expect(p.age, equals(0));
    });
    test("Age harus positif", () {
      p.age = -2;
      expect(p.age, isPositive);
    });

    test("Angka keberuntungan harus 3 buah bilangan positif", () {
      expect(p.luckyNumbers,
          allOf([hasLength(equals(3)), isNot(anyElement(isNegative))]));
    });
  });

  setUp(() {
    print("Set Up");
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito_example_63/warrior.dart';

class MockWarrior extends Mock implements Warrior {}

void main() {
  MockWarrior warrior = MockWarrior();

  test("Verify Demo", () async {
    warrior.rest();
    await warrior.training();
    verifyInOrder([warrior.rest(), warrior.training()]);
  });

  test("Null Demo", () {
    expect(warrior.name, isNull);
  });

  test("thenReturn Demo", () {
    when(warrior.name).thenReturn("no name");
    expect(warrior.name, equals("no name"));
  });

  test("thenThrow Demo", () {
    when(warrior.rest()).thenThrow(Exception("Cant sleep"));
    expect(() => warrior.rest(), throwsException);
  });

  test("thenAnswer Demo", () async {
    when(warrior.training()).thenAnswer((_) async => true);
    bool result = await warrior.training();
    expect(result, equals(true));
  });
}

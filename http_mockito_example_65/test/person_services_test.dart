import 'package:flutter_test/flutter_test.dart';
import 'package:http_mockito_example_65/person.dart';
import 'package:http_mockito_example_65/person_services.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient client;

  setUp(() {
    client = MockClient();
  });

  test('Test Ambil Data', () async {
    String id = "1";

    when(() => client.get(Uri.parse("http://localhost/persons/$id")))
        .thenAnswer((_) async => http.Response('''{
              "id": 1,
              "name": "razzi",
              "age": 26
            }''', 200));

    Person person = await PersonServices.getPersonById(id, client);

    expect(person, equals(const Person(id: 1, name: "razzi", age: 26)));
  });

  test('Test Error', () async {
    String id = "1";

    when(() => client.get(Uri.parse("http://localhost/persons/$id")))
        .thenAnswer((_) async => http.Response('''{
            "message": "Tidak ada akses"
            }''', 403));

    expect(PersonServices.getPersonById(id, client), throwsException);
  });
}

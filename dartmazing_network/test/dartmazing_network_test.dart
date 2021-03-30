import 'package:dartmazing_network/dartmazing_network.dart';
import 'package:dartmazing_network/http_verbs.dart';
import 'package:dartmazing_network/request_abstract.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeInvalidRequest extends RequestAbstract {
  FakeInvalidRequest() : super(null, null, null, {}, {}, {}, null);
}

class FakeValidRequest extends RequestAbstract {
  FakeValidRequest() : super(
    "https", 
    "api.github.com", 
    "/search/repositories", 
    {},
    {},
    {},
    HttpVerbs.GET
  ); 
}

class Person {
  String name;
  String lastName;

  Person({
    this.name,
    this.lastName
  });

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['lastName'];
  }
}

void main() {
  const MethodChannel channel = MethodChannel('dartmazing_network');

  TestWidgetsFlutterBinding.ensureInitialized();

  dynamic mockResponse = {};

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      final arguments = Map<String, dynamic>.from(methodCall.arguments);
      if (arguments["url"] != null || arguments["method"] != null) {
        return mockResponse;
      } else {
        throw PlatformException(code: "invalidArguments", message: "invalidArguments");
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  group('#performNativeRequest', () {
    group('when is valid request object', () {
      test('returns success response', () async {
        mockResponse = {
          "statusCode": "200",
          "response": '{"name":"John","lastName":"Lennon"}'
        };

        final response = await DartmazingNetwork().execute(request: FakeValidRequest(),  factory: (json) => Person.fromJson(json));
        expect(response.statusCode, "200");
        expect(response.response.name, "John");
        expect(response.response.name, "Lennon");
        
      });
      test('returns error response', () async {
        mockResponse = PlatformException(code: "errorResponse", message: "errorResponse");
        try {
          await DartmazingNetwork().execute(request: FakeValidRequest(),  factory: (json) => Person.fromJson(json));
          fail('Exception expected');
        } on PlatformException catch (e) {
           expect(e.code, equals('bad'));
      //   expect(e.message, equals('Something happened'));
      //   expect(e.details, equals(<String, dynamic>{'a': 42, 'b': 3.14}));

        }        
      });
    });

    group('when is invalid request object', () {
      test('returns error response', () async {
        final network = DartmazingNetwork();
        network.execute(request: FakeInvalidRequest(),  factory: (json) => Person.fromJson(json))
        .then( (response) {
          expect(true, false);
        })
        .catchError( (error) {
          if (error is PlatformException) {
            expect(error.code, "errorResponse");
          } else {
            expect(true, false);
          }
        });
      });

    });

  });

  
}

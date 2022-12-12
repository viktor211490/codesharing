import 'package:dart_frog/dart_frog.dart';
import 'package:shared/shared.dart';

Response onRequest(RequestContext context) {
  final user = new User(email: 'email@mail.ru', id: null);
  return Response(body: 'Welcome to Dart Frog!${user.email}');
}

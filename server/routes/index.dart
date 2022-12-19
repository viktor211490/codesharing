import 'dart:async';

import 'package:dart_frog/dart_frog.dart';
import 'package:postgres/postgres.dart';
import 'package:shared/shared.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  const user = User(email: 'someuser@mail.com', id: 'user');
  final connection = context.read<PostgreSQLConnection>();
  await connection.open();
  final result = await connection.query('SELECT NOW()');
  print(result);
  // ignore: lines_longer_than_80_chars
  return Response(
    body:
        'Welcome to Dart Frog!, ${user.email}. The current time is: ${result[0][0]}',
  );
}

import 'dart:async';
import 'dart:convert';
import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart';
import 'package:stormberry/internals.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  final db = context.read<Database>();
  final user = await db.users.queryUser(1);
  final data = await db.query('SELECT now()');
  print(data);
  if (user == null) {
    return Response(body: 'Not found', statusCode: 404);
  }
  final sharedUser = User.fromDb(user);
  return Response.json(
    body: sharedUser.toJson(),
    // headers: {'Content-Type': 'application/json'},
  );
}

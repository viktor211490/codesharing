import 'package:dart_frog/dart_frog.dart';
import 'package:stormberry/internals.dart';

// final connection = PostgreSQLConnection(
//   'localhost',
//   5432,
//   'postgres',
//   username: 'postgres',
//   password: 'password',
// );

final db = Database(
  host: 'localhost',
  port: 5432,
  database: 'postgres',
  user: 'posstgres',
  password: 'password',
  useSSL: false,
  isUnixSocket: false,
);

Handler middleware(Handler handler) {
  return handler.use(provider<Database>((context) => db));
}

import 'package:dart_frog/dart_frog.dart';
import 'package:stormberry/internals.dart';

final db = Database(
  host: '176.119.147.235',
  port: 5432,
  database: 'codesharing',
  user: 'dbuser',
  password: '12321Qq!',
  useSSL: true,
  isUnixSocket: true,
);

Handler middleware(Handler handler) {
  return handler.use(provider<Database>((context) => db));
}

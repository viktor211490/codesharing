import 'package:stormberry/internals.dart';

@Model()
abstract class User {
  @PrimaryKey()
  @AutoIncrement()
  int get id;

  String get name;
  String? get email;
}

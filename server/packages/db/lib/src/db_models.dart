import 'package:stormberry/internals.dart';

@Model()
abstract class User {
  @PrimaryKey()
  String get id;

  String get name;
}

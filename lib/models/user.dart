import 'package:meta/meta.dart';

class User {
  final String uid;
  final String username;
  final String imageUrl;
  final String userRight;

  User(
      {@required this.uid,
      @required this.username,
      @required this.imageUrl,
      @required this.userRight});
}

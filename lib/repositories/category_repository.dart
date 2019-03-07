import 'package:meta/meta.dart';

class CategoryRepository {
  Future<String> createCategory({@required String title, @required String description}) async {
    await Future.delayed(Duration(seconds: 2));
    return 'categoryGeneratedId';
  }
}
import 'package:fashion_connect/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdminCategoryFormPage extends StatefulWidget {
  @override
  _AdminCategoryFormPageState createState() => _AdminCategoryFormPageState();
}

class _AdminCategoryFormPageState extends State<AdminCategoryFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: AdminCategoryForm()),
    );
  }
}

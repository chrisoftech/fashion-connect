import 'package:fashion_connect/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdminCategoriesPage extends StatefulWidget {
  @override
  _AdminCategoriesState createState() => _AdminCategoriesState();
}

class _AdminCategoriesState extends State<AdminCategoriesPage> {
  Widget _buildCategoryFAB() {
    return FloatingActionButton(
      tooltip: 'Add Category',
      child: Icon(
        Icons.add,
        size: 35.0,
      ),
      onPressed: () => Navigator.of(context).pushNamed('/admin-category-form'),
    );
  }

  Widget _buildAppBarLeading() {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () =>
          Navigator.of(context).pushReplacementNamed('/admin-dashboard'),
    );
  }

  Widget _buildSearchTextField() {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: TextFormField(
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            hintText: 'Search',
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            filled: true,
            prefixIcon: Icon(
              Icons.search,
            ),
            suffixIcon: Icon(
              Icons.mic,
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20.0))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: _buildCategoryFAB(),
          appBar: AppBar(
            centerTitle: true,
            leading: _buildAppBarLeading(),
            title: Text('Categories'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: _buildSearchTextField(),
            ),
          ),
          body: AdminCategories()),
    );
  }
}

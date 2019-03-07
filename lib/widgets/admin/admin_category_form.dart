import 'package:flutter/material.dart';

class AdminCategoryForm extends StatefulWidget {
  @override
  _AdminCategoryFormState createState() => _AdminCategoryFormState();
}

class _AdminCategoryFormState extends State<AdminCategoryForm> {
  Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Category Title',
        filled: true,
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Category title is required!';
        }
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: 'Category Description',
        filled: true,
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Category description is required!';
        }
      },
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildCategoryFormControl() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50.0,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        alignment: Alignment.center,
        child: Text(
          'Save',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildLabelText({@required String title}) {
    return Column(
      children: <Widget>[
        Text('$title',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        Divider(height: 20.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          floating: true,
          flexibleSpace: Image.asset(
            'assets/placeholder/placeholder.png',
            fit: BoxFit.cover,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(200.0),
            child: Container(
              child: ButtonBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0, color: Theme.of(context).accentColor),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo,
                          size: 35.0, color: Theme.of(context).accentColor),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _buildLabelText(title: 'Category Details'),
                      _buildTitleTextField(),
                      SizedBox(height: 20.0),
                      _buildDescriptionTextField(),
                      SizedBox(height: 20.0),
                      _buildCategoryFormControl()
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

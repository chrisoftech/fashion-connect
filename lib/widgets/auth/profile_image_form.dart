import 'package:flutter/material.dart';

class ProfileImageForm extends StatefulWidget {
  @override
  _ProfileImageFormState createState() => _ProfileImageFormState();
}

class _ProfileImageFormState extends State<ProfileImageForm> {
  Widget _buildImagePlaceHolder() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 250.0,
        width: 250.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(125.0),
            border: Border.all(color: Colors.white, width: 2.0)),
        child: CircleAvatar(
            radius: 125.0,
            backgroundImage: AssetImage('assets/avatar/avatar.png')),
      ),
    );
    // backgroundImage: _imageFile == null
    //     ? AssetImage('assets/avatar/avatar.png')
    //     : FileImage(_imageFile)));
  }

  Widget _buildFormcontrols() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 40.0,
            width: 160.0,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            child: Text('Save & Continue',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildImagePlaceHolder(),
              SizedBox(height: 40.0),
              _buildFormcontrols(),
            ],
          ),
        ),
      ),
    );
  }
}

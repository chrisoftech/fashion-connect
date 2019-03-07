import 'package:fashion_connect/utilities/utilities.dart';
import 'package:flutter/material.dart';

class AdminDashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      drawer: AdminDrawer(),
    );
  }
}

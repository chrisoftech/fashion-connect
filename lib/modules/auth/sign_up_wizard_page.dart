import 'package:fashion_connect/modules/modules.dart';
import 'package:flutter/material.dart';

class SignUpWizardPage extends StatefulWidget {
  @override
  _SignUpWizardPageState createState() => _SignUpWizardPageState();
}

class _SignUpWizardPageState extends State<SignUpWizardPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  // User authenticatedUser;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/auth_bg.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.5), BlendMode.darken),
            ),
          ),
          child: TabBarView(
            controller: _tabController,
            // physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              ProfileFormPage(),
              ProfileImageUploadPage(),
              // AcceptTermsPage(_navigateBackwards)
            ],
          ),
        ),
      ),
    );
  }
}

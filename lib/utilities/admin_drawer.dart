import 'package:fashion_connect/blocs/auth_bloc.dart';
import 'package:fashion_connect/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);

    Widget _buildDrawerAppBar() {
      return AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          'MENU',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
        ),
      );
    }

    Widget _buildDrawerListTile(
        {@required IconData icon,
        @required String title,
        @required String route,
        bool signout = false,
        bool addDivider = false,
        bool navigatorPushReplacement = false}) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
                child: Icon(icon, color: Theme.of(context).accentColor)),
            title: Text(
              '$title',
              style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              if (signout) {
                Navigator.of(context).pop();
                _authBloc.onLoggedOut();
                Navigator.of(context).pushReplacementNamed('/');
              } else {
                if (route.isEmpty) {
                  return;
                }
                navigatorPushReplacement
                    ? Navigator.of(context).pushReplacementNamed('$route')
                    : Navigator.of(context).pushNamed('$route');
              }
            },
          ),
          addDivider ? Divider(height: 20.0) : Container(),
        ],
      );
    }

    return Drawer(
      child: SafeArea(
        child: Scaffold(
          appBar: _buildDrawerAppBar(),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: <Widget>[
                        _buildDrawerListTile(
                            icon: Icons.timeline,
                            title: 'Timeline',
                            route: '/',
                            addDivider: true,
                            navigatorPushReplacement: true),
                        _buildDrawerListTile(
                            icon: Icons.supervisor_account,
                            title: 'Accounts',
                            route: '',
                            navigatorPushReplacement: true),
                        _buildDrawerListTile(
                            icon: Icons.category,
                            title: 'Categories',
                            route: '',
                            navigatorPushReplacement: true),
                        _buildDrawerListTile(
                            icon: Icons.store,
                            title: 'Products',
                            route: '',
                            addDivider: true,
                            navigatorPushReplacement: true),
                        _buildDrawerListTile(
                            icon: Icons.graphic_eq,
                            title: 'Statistics',
                            route: '',
                            addDivider: true,
                            navigatorPushReplacement: true),
                        _buildDrawerListTile(
                            icon: Icons.exit_to_app,
                            title: 'Signout',
                            route: '',
                            signout: true),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

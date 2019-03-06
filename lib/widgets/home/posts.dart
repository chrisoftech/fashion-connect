import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;
    final double _postListHeight = _screenHeight - 210.0;

    return Container(
      height: _postListHeight,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          final bool isFavorite = index % 2 == 0;

          return Container(
            padding: EdgeInsets.all(10.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/temp$index.jpg'),
                    ),
                    title: Text('Cybotech Concepts'),
                    subtitle: Text('Accra central area'),
                    trailing: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: IconButton(
                          color: Theme.of(context).errorColor,
                          icon: Icon(isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                  FadeInImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/temp$index.jpg'),
                    placeholder: AssetImage('assets/loader/loader.gif'),
                  ),
                  ListTile(
                    title: Text('Hanging out on the beach!'),
                    subtitle: Text(
                        'Just Chilling out with som friends and loved ones ...'),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

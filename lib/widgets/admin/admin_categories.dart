import 'package:flutter/material.dart';

class AdminCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;
    final double _postListHeight = _screenHeight - 70.0;

    Widget _buildCategoryImage({@required String imageUrl}) {
      return Stack(
        children: <Widget>[
          Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(33.3))),
          Positioned(
            top: 5.0,
            left: 5.0,
            child: Container(
                height: 90.0,
                width: 90.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(45.0))),
          ),
          Positioned(
            top: 15.0,
            left: 15.0,
            child: CircleAvatar(
              radius: 35.0,
              backgroundImage: AssetImage(imageUrl),
            ),
          )
        ],
      );
    }

    Widget _buildCategoryTitleRow({@required String categoryTitle}) {
      return AppBar(
        title: Text('$categoryTitle'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      );
    }

    Widget _buildCategoryDescription({@required String categoryDescription}) {
      return Text(
        categoryDescription.length > 50
            ? '${categoryDescription.substring(0, 50)}...'
            : '$categoryDescription',
        softWrap: true,
        style: TextStyle(fontWeight: FontWeight.bold),
      );
    }

    return Container(
      height: _postListHeight,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildCategoryImage(
                        imageUrl: 'assets/images/temp$index.jpg'),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildCategoryTitleRow(
                                categoryTitle: 'Category $index'),
                            SizedBox(height: 20.0),
                            _buildCategoryDescription(
                                categoryDescription:
                                    'Category Description $index'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

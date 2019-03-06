import 'package:fashion_connect/utilities/utilities.dart';
import 'package:fashion_connect/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget _buildFavoriteToggle() {
    return IconButton(
      icon: Icon(
        Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {},
    );
  }

  Widget _buildPostCategory({@required BuildContext context}) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text(
                'Categories',
                style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 20.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0)),
                ),
                child: _buildFavoriteToggle()),
          ],
        ),
        SizedBox(height: 5.0),
        Container(
          height: 70.0,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: <Widget>[
                  SizedBox(width: 5.0),
                  Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        border: Border.all(
                            width: 2.0,
                            color: Theme.of(context).primaryColorLight)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35.0),
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/temp$index.jpg'),
                        placeholder: AssetImage('assets/loader/loader.gif'),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
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

  Widget _buildAppBarBottom({@required BuildContext context}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(140.0),
      child: Column(
        children: <Widget>[
          _buildPostCategory(context: context),
          SizedBox(height: 15.0),
          _buildSearchTextField(),
        ],
      ),
    );
  }

  Widget _buildAddPostFAB({@required BuildContext context}) {
    // final shoppingCart = ShoppingCartBottomSheet(context: context);

    return FloatingActionButton(
      isExtended: true,
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(
        Icons.add_a_photo,
        size: 35.0,
        color: Theme.of(context).accentColor,
      ),
      onPressed: () {},
      // onPressed: shoppingCart.openShoppingCart,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        drawer: SideDrawer(),
        floatingActionButton: _buildAddPostFAB(context: context),
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                centerTitle: false,
                pinned: true,
                floating: true,
                snap: true,
                automaticallyImplyLeading: true,
                bottom: _buildAppBarBottom(context: context),
              ),
              SliverToBoxAdapter(
                child: Posts(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:duddy_store/product_list_tab.dart';
import 'package:duddy_store/search_tab.dart';
import 'package:duddy_store/shopping_cart_tab.dart';

class DuddyStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Limit orientation to portrait only
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return CupertinoApp(
      home: CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Products'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('Cart'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView onscreenTab;
        switch (index) {
          case 0:
            onscreenTab = _buildTabView(ProductListTab());
            break;
          case 1:
            onscreenTab = _buildTabView(SearchTab());
            break;
          case 2:
            onscreenTab = _buildTabView(ShoppingCartTab());
            break;
        }
        return onscreenTab;
      },
    );
  }

  Widget _buildTabView(Widget tab) {
    return CupertinoTabView(
      builder: (context) {
        return CupertinoPageScaffold(child: tab);
      },
    );
  }
}

//return const CupertinoPageScaffold(
//      navigationBar: CupertinoNavigationBar(middle: Text('Duddy Store'),),
//      child: SizedBox(),
//    );

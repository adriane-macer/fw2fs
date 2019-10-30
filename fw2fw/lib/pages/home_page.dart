
import 'package:flutter/material.dart';
import 'package:fw2fw/pages/learn.dart';
import 'package:fw2fw/pages/pickups.dart';
import 'package:fw2fw/pages/post.dart';

class _DrawerItem {
  IconData icon;
  String title;
  _DrawerItem(this.icon, this.title);
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  final drawerItems = [
    _DrawerItem(Icons.local_library, "Posts"),
    _DrawerItem(Icons.directions_bike,"Pickups",),
    _DrawerItem(Icons.dashboard, "Learn"),
    _DrawerItem(Icons.help_outline, "Help"),
    _DrawerItem(Icons.settings, "Settings"),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _drawerSelectedIndex = 0;
  String title;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0: return Post();
      case 1: return Pickups();
      case 2: return Learn();
      default: return Center(child: new Text("Not yet available"));
    }
  }

  @override
  void initState() {
    super.initState();
    title = "${widget.drawerItems[0].title}";
  }

  _onSelectItem(int index) {
    setState(() {
      _drawerSelectedIndex = index;

      title = widget.drawerItems[index].title;
    });
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _drawerSelectedIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      drawer: Drawer(
        child: new Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('Convert food waste to valuable fertilizers'),
              accountName: Text('FW2FS'),
              currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network('https://sorasystem.sirv.com/logosora/f2f.png'),

                  ),
                  backgroundColor: Colors.transparent
                // backgroundImage: NetworkImage(''),
              ),
            ),
            Column(children: drawerOptions)],
        ),
      ),
      body: _getDrawerItemWidget(_drawerSelectedIndex),
    );
  }
}

import 'package:architech/components/logos.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/bottomAppBarModel.dart';
import 'package:architech/pages/home.dart';
import 'package:architech/pages/orders.dart';
import 'package:architech/pages/profile.dart';
import 'package:architech/pages/support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

AppBar topBar(BuildContext context){
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
        },
        child: appLogo("assets/logo_small.png", 130)
      ),
    ),
    leadingWidth: 160,
  );
}

AppBar titleBar(BuildContext context, String text, double margin){
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 24,
        color: Colors.black
      ),
      onPressed: (){
        Navigator.pop(context);
      }
    ),
    title: Container(
      margin: EdgeInsets.only(left: margin),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: mainTitle
        )
      ),
    ),
  );
}

// Temporary
Container bottomBar(BuildContext context){
  return Container(
    height: 80,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    margin: const EdgeInsets.symmetric(horizontal: 20),
    decoration: const BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20)
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()))
          },
          child: barItems[0].icon
        ),
        InkWell(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Orders()))
          },
          child: barItems[1].icon
        ),
        InkWell(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Support()))
          },
          child: barItems[2].icon
        ),
        InkWell(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Profile()))
          },
          child: barItems[3].icon
        ),
        // List.generate(
        //   4, (index) => SizedBox(
        //     child: InkWell(
        //       onTap: () => {
        //         Navigator.of(context).push(barItems[index].route)
        //       },
        //       child: barItems[index].icon,
        //     )
        //   )
        // ),
      ]
    ),
  );
}

class BottomAppBarDemo extends StatefulWidget {
  const BottomAppBarDemo({super.key});

  @override
  State createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  static const List<Color> colors = <Color>[
    Colors.yellow,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.cyan,
  ];

  static final List<Widget> items = List<Widget>.generate(
    colors.length,
    (int index) => Container(color: colors[index], height: 150.0),
  ).reversed.toList();

  late ScrollController _controller;
  bool _showFab = true;
  bool _isElevated = true;
  bool _isVisible = true;

  FloatingActionButtonLocation get _fabLocation => _isVisible
      ? FloatingActionButtonLocation.endContained
      : FloatingActionButtonLocation.endFloat;

  void _listen() {
    final ScrollDirection direction = _controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      _show();
    } else if (direction == ScrollDirection.reverse) {
      _hide();
    }
  }

  void _show() {
    if (!_isVisible) {
      setState(() => _isVisible = true);
    }
  }

  void _hide() {
    if (_isVisible) {
      setState(() => _isVisible = false);
    }
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  void _onElevatedChanged(bool value) {
    setState(() {
      _isElevated = value;
    });
  }

  void _addNewItem() {
    setState(() {
      items.insert(
        0,
        Container(color: colors[items.length % 5], height: 150.0),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_listen);
  }

  @override
  void dispose() {
    _controller.removeListener(_listen);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bottom App Bar Demo'),
        ),
        body: Column(
          children: <Widget>[
            SwitchListTile(
              title: const Text('Floating Action Button'),
              value: _showFab,
              onChanged: _onShowFabChanged,
            ),
            SwitchListTile(
              title: const Text('Bottom App Bar Elevation'),
              value: _isElevated,
              onChanged: _onElevatedChanged,
            ),
            Expanded(
              child: ListView(
                controller: _controller,
                children: items.toList(),
              ),
            ),
          ],
        ),
        floatingActionButton: _showFab
            ? FloatingActionButton(
                onPressed: _addNewItem,
                tooltip: 'Add New Item',
                elevation: _isVisible ? 0.0 : null,
                child: const Icon(Icons.add),
              )
            : null,
        floatingActionButtonLocation: _fabLocation,
        bottomNavigationBar:
            _DemoBottomAppBar(isElevated: _isElevated, isVisible: _isVisible),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    required this.isElevated,
    required this.isVisible,
  });

  final bool isElevated;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: isVisible ? 80.0 : 0,
      child: BottomAppBar(
        elevation: isElevated ? null : 0.0,
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open popup menu',
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                final SnackBar snackBar = SnackBar(
                  content: const Text('Yay! A SnackBar!'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                );

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pink,
          title: Text('Notifications Page'),
        ),
        floatingActionButton: _FloatingButton(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int notificationsCount = Provider.of<_NotificationModel>(context).counter;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(label: 'Bones', icon: FaIcon(FontAwesomeIcons.bone)),
        BottomNavigationBarItem(
            label: 'Notifications',
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0,
                  right: 0.0,
                  child: BounceInDown(
                    from: 10,
                    animate: notificationsCount > 0,
                    child: Bounce(
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context, listen: false).bounceController = controller,
                      from: 10,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          '$notificationsCount',
                          style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                        ),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        BottomNavigationBarItem(label: 'My Dog', icon: FaIcon(FontAwesomeIcons.dog)),
      ],
    );
  }
}

// Icon(Icons.brightness_1,size: 12,color: Colors.pinkAccent),

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Provider.of<_NotificationModel>(context, listen: false).counter += 1;
      },
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.pink,
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _counter = 0;
  late AnimationController _bounceController;

  int get counter => this._counter;
  AnimationController get bounceController => this._bounceController;

  set counter(int value) {
    this._counter = value;
    // this._bounceController.repeat();
    this._bounceController.forward(from: 0.0);
    notifyListeners();
  }

  set bounceController(AnimationController controller) {
    this._bounceController = controller;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import '../screens/homepage_screen.dart';

class AppDrawer extends StatefulWidget {
  final Widget? childWidget;
  AppDrawer(this.childWidget);
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.orange,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          // title: const Text('Advanced Drawer Example'),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible
                        ? Icons.clear
                        : Icons.format_list_bulleted_sharp,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: widget.childWidget,
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 80),
                DrawerList(Icons.account_circle_rounded, 'Profile', () {}),
                const Divider(
                  color: Colors.white,
                  indent: 75,
                  endIndent: 30,
                ),
                DrawerList(Icons.shopping_cart_checkout_sharp, 'Orders', () {}),
                const Divider(
                  color: Colors.white,
                  indent: 75,
                  endIndent: 30,
                ),
                DrawerList(Icons.discount_outlined, 'Offer and Promo', () {}),
                const Divider(
                  color: Colors.white,
                  indent: 75,
                  endIndent: 30,
                ),
                DrawerList(
                    Icons.text_snippet_outlined, 'Privacy Policy', () {}),
                const Divider(
                  color: Colors.white,
                  indent: 75,
                  endIndent: 30,
                ),
                DrawerList(Icons.security_sharp, 'Security', () {}),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Sign-Out  ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

class DrawerList extends StatelessWidget {
  IconData icon;
  String text;
  Function func;

  DrawerList(this.icon, this.text, this.func);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => func,
      // leading: Icon(Icons.home),
      leading: Icon(
        icon,
        size: 36,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}

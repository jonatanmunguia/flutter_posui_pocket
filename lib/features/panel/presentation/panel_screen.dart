import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/navigations/aplazo_navbar.dart';

class PanelScreen extends StatelessWidget {
  const PanelScreen({super.key});

  static const idScreen = 'Panel_screen';

  @override
  Widget build(BuildContext context) {
    return const PanelBody();
  }
}

class PanelBody extends StatelessWidget {
  const PanelBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Placeholder(),
      ),
      appBar: AplazoNavbar(
        navbarProps: NavbarProps(title: 'Panel'),
      ),
    );
  }
}

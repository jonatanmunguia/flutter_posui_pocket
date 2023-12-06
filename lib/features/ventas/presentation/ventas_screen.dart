import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/navigations/aplazo_navbar.dart';

class VentasScreen extends StatelessWidget {
  const VentasScreen({super.key});

  static const idScreen = 'Panel_screen';

  @override
  Widget build(BuildContext context) {
    return const VentasBody();
  }
}

class VentasBody extends StatelessWidget {
  const VentasBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Placeholder(),
      ),
      appBar: AplazoNavbar(
        navbarProps: NavbarProps(title: 'Ventas'),
      ),
    );
  }
}

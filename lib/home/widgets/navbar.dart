import 'package:flutter/material.dart';


class WidgetNavbar extends StatelessWidget {
  const WidgetNavbar({
    super.key,
    required bool isScrolled,
    required this.scrollToSomosOnt,
    required this.scrollToPublicaciones,
    required this.scrollToGestion,
    required this.scrollToContactanos,
  }) : _isScrolled = isScrolled;

  final bool _isScrolled;
  final VoidCallback scrollToSomosOnt;
  final VoidCallback scrollToPublicaciones;
  final VoidCallback scrollToGestion;
  final VoidCallback scrollToContactanos;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _isScrolled ? 0 : MediaQuery.of(context).size.height * 0.1,
      left: 0,
      right: 0,
      child: Center( // Centra el Navbar
        child: Container( // Limita el ancho al 80%
          width: MediaQuery.of(context).size.width * 0.8,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: MediaQuery.of(context).size.height * 0.05,// 0.1
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: _isScrolled ? Colors.white : Colors.blue[800],
              boxShadow: _isScrolled
                  ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ]
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (_isScrolled)
                      Image.asset(
                        'assets/logo.png',
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    const SizedBox(width: 10),
                  ],
                ),
                Row(
                  children: [
                    NavItem(
                      text: 'Somos ONT',
                      isScrolled: _isScrolled,
                      onTap: scrollToSomosOnt,
                    ),
                    const SizedBox(width: 20),
                    NavItem(
                      text: 'Publicaciones',
                      isScrolled: _isScrolled,
                      onTap: scrollToPublicaciones,
                    ),
                    const SizedBox(width: 20),
                    NavItem(
                      text: 'Gestión',
                      isScrolled: _isScrolled,
                      onTap: scrollToGestion,
                    ),
                    const SizedBox(width: 20),
                    NavItem(
                      text: 'Contáctanos',
                      isScrolled: _isScrolled,
                      onTap: scrollToContactanos,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}










class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.text,
    required this.isScrolled,
    required this.onTap,
  });

  final String text;
  final bool isScrolled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isScrolled ? Colors.blue[800] : Colors.white,
          ),
        ),
      ),
    );
  }
}
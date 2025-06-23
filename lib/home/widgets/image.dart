import 'package:flutter/material.dart';


class WidgetImage extends StatefulWidget {
  const WidgetImage({super.key, required this.scroll});
  final bool scroll;
  @override
  State<WidgetImage> createState() => _WidgetImageState();
}

class _WidgetImageState extends State<WidgetImage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;//widget.scroll? MediaQuery.of(context).size.height * 2: MediaQuery.of(context).size.height * 0.9;
    final carouselHeight = screenHeight / 2; // Altura del carrusel (primera mitad)


    final BoxFit imageFit = BoxFit.cover;//widget.scroll ? BoxFit.fill : BoxFit.cover;
    return Container(
      height: MediaQuery.of(context).size.height,//widget.scroll? MediaQuery.of(context).size.height * 2: MediaQuery.of(context).size.height * 0.9,//MediaQuery.of(context).size.height * 2,//* 0.9,//widget.scroll? MediaQuery.of(context).size.height * 2: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          // Contenido principal dividido
          Column(
            children: [
              // Carrusel de imágenes (primera mitad)
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 6,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/${index + 1}.jpeg'),
                          fit: imageFit,
                          alignment: Alignment.center,
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Segunda mitad con imagen fija
              Expanded(
                child: Container(
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/mapavzla.png'),
                      fit: imageFit,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Botón de navegación izquierdo
          if (_currentPage > 0)
            Positioned(
              left: 20,
              top: carouselHeight / 2 - 20,
              child: _buildNavigationButton(
                icon: Icons.chevron_left,
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),

          // Botón de navegación derecho
          if (_currentPage < 5)
            Positioned(
              right: 20,
              top: carouselHeight / 2 - 20,
              child: _buildNavigationButton(
                icon: Icons.chevron_right,
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),

          // Indicadores de página
          Positioned(
            bottom: widget.scroll? MediaQuery.of(context).size.height+20  :MediaQuery.of(context).size.height * 0.5 + 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
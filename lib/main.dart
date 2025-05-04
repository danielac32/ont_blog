import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog ONT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: Colors.blue[800]!,
          secondary: Colors.blue[600]!,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  final double _headerHeight = 80;
  final double _navBarHeight = 60;

  final GlobalKey somosOntKey = GlobalKey();
  final GlobalKey publicacionesKey = GlobalKey();
  final GlobalKey gestionKey = GlobalKey();
  final GlobalKey contactanosKey = GlobalKey();


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset > 100 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 100 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }

  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                 // Espacio para el navbar fijo
                // Sección de banner con imagen
                //SizedBox(height: _headerHeight + _navBarHeight),
                WidgetHeader(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                WidgetImage(),
                /*WidgetImage1(key: somosOntKey),
                WidgetImage2(),*/
                // Sección de misión, visión, etc.
                WidgetMissionVision(key: publicacionesKey),

                // Sección de estadísticas
                WidgetStatistic(),

                // Sección de gráfica y programación financiera
                WidgetGraph(),

                // Sección de resumen de gestión (cards)
                WidgetSummary(key: gestionKey),

                SizedBox(height: 10),
                WidgetContact(key: contactanosKey),
                 
              ],
            ),
          ),

          // Navbar fijo en la parte superior
          //WidgetNavbar(isScrolled: _isScrolled),
          WidgetNavbar(
            isScrolled: _isScrolled,
            scrollToSomosOnt: () => _scrollToSection(somosOntKey),
            scrollToPublicaciones: () => _scrollToSection(publicacionesKey),
            scrollToGestion: () => _scrollToSection(gestionKey),
            scrollToContactanos: () => _scrollToSection(contactanosKey),
          ),
        ],
      ),
    );
  }

}



double getNavBarHeight(){
  final double navBarHeight = 60;
  return navBarHeight;
}

double gethHeaderHeight(){
  final double headerHeight = 80;
  return headerHeight;
}


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
      top: _isScrolled? 0: MediaQuery.of(context).size.height * 0.1,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: MediaQuery.of(context).size.height * 0.1,
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
                    'assets/logo.png', // Reemplaza con tu logo
                    height: 50,
                  ),
                const SizedBox(width: 10),
                Text(
                  'ONT',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: _isScrolled ? Colors.blue[800] : Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                NavItem(text: 'Somos ONT', isScrolled: _isScrolled,onTap: scrollToSomosOnt),
                NavItem(text:'Publicaciones',isScrolled: _isScrolled,onTap: scrollToPublicaciones),
                NavItem(text:'Gestión',isScrolled: _isScrolled,onTap:scrollToGestion),
                NavItem(text:'Contáctanos',isScrolled: _isScrolled,onTap:scrollToContactanos),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class WidgetContact extends StatelessWidget {
   WidgetContact({super.key});
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
        height: MediaQuery.of(context).size.height *0.9,
        width: MediaQuery.of(context).size.width *0.9,
        decoration:BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ) ,
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [

         ],
       ),
    );
  }
}

class WidgetSummary extends StatelessWidget {
  const WidgetSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.grey[100],
      child: Column(
        children: [
          const Text(
            'RESUMEN DE GESTIÓN',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              ManagementCard(
                title: 'Proyectos completados',
                value: '48',
                icon: Icons.check_circle,
                color: Colors.green,
              ),
              ManagementCard(
                title: 'Proyectos en curso',
                value: '15',
                icon: Icons.construction,
                color: Colors.orange,
              ),
              ManagementCard(
                title: 'Capacitaciones realizadas',
                value: '32',
                icon: Icons.school,
                color: Colors.blue,
              ),
              ManagementCard(
                title: 'Beneficiarios directos',
                value: '1,250',
                icon: Icons.people,
                color: Colors.purple,
              ),
              ManagementCard(
                title: 'Aliados estratégicos',
                value: '28',
                icon: Icons.handshake,
                color: Colors.teal,
              ),
              ManagementCard(
                title: 'Inversión total',
                value: '\$2.8M',
                icon: Icons.attach_money,
                color: Colors.green[700]!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ManagementCard extends StatelessWidget {
  const ManagementCard({super.key, required this.title, required this.value, required this.icon, required this.color});
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetGraph extends StatelessWidget {
  const WidgetGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'GRÁFICA DE TORTA AQUÍ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PROGRAMACIÓN FINANCIERA',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),
                LegendItem(text: 'Presupuesto asignado',color: Colors.blue),
                LegendItem(text: 'Ejecutado',color: Colors.green),
                LegendItem(text: 'Pendiente',color: Colors.orange),
                LegendItem(text: 'Ajustes',color: Colors.red),
                const SizedBox(height: 20),
                const Text(
                  'Nuestra programación financiera se basa en principios de transparencia y eficiencia, garantizando el uso óptimo de los recursos para el cumplimiento de nuestros objetivos institucionales.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class LegendItem extends StatelessWidget {
  const LegendItem({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class WidgetStatistic extends StatelessWidget {
  const WidgetStatistic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue[800]!, Colors.blue[600]!],
        ),
      ),
      child: Column(
        children: [
          const Text(
            'NUESTRO ALCANCE',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Statistic(number: '50', label: 'Organismos'),
              Statistic(number: '23', label: 'Gobernaciones'),
              Statistic(number: '300', label: 'Alcaldías'),
            ],
          ),
        ],
      ),
    );
  }
}
class Statistic extends StatelessWidget {
  const Statistic({super.key, required this.number, required this.label});
  final String number;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class WidgetMissionVision extends StatelessWidget {
  const WidgetMissionVision({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.grey[100],
      child: Column(
        children: [
          const Text(
            'QUIÉNES SOMOS',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoCard(
                title: 'MISIÓN',
                content: 'Nuestra misión es proporcionar soluciones innovadoras y eficientes para el desarrollo organizacional y tecnológico.',
                icon: Icons.flag,
              ),
              InfoCard(
                title:'VISIÓN',
                content:'Ser líderes en transformación digital y gestión organizacional a nivel nacional e internacional.',
                icon:Icons.visibility,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoCard(
                title:'VALORES',
                content:'Integridad, Innovación, Excelencia, Trabajo en equipo, Responsabilidad social.',
                icon:Icons.star,
              ),
              InfoCard(
                title:'OBJETIVO',
                content:'Fortalecer las capacidades institucionales mediante soluciones tecnológicas y de gestión.',
                icon:Icons.track_changes,
              ),
            ],
          ),
        ],
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

class InfoCard extends StatelessWidget {
   InfoCard({super.key, required this.title, required this.content, required this.icon});
   final String title;
   final String content;
   final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                icon,
                size: 50,
                color: Colors.blue,
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetImage2 extends StatelessWidget {
  const WidgetImage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/2.jpeg'), // Reemplaza con tu imagen
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}



class WidgetImage extends StatefulWidget {
  const WidgetImage({super.key});

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
    final screenHeight = MediaQuery.of(context).size.height * 0.9;
    final carouselHeight = screenHeight / 2; // Altura del carrusel (primera mitad)
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
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
                  itemCount: 5,
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
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Segunda mitad con imagen fija
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/1.jpeg'),
                      fit: BoxFit.cover,
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
          if (_currentPage < 4)
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
            bottom: MediaQuery.of(context).size.height * 0.5 + 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
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

class WidgetImage1 extends StatelessWidget {
  const WidgetImage1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/1.jpeg'), // Reemplaza con tu imagen
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          'BIENVENIDOS A ONT',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.8),
                offset: const Offset(2, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetHeader extends StatelessWidget {
  const WidgetHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/cintillo2.jpeg'),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}
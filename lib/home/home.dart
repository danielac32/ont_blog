import 'package:flutter/material.dart';
import 'package:ont_blog/home/widgets/contact.dart';
import 'package:ont_blog/home/widgets/graph.dart';
import 'package:ont_blog/home/widgets/header.dart';
import 'package:ont_blog/home/widgets/image.dart';
import 'package:ont_blog/home/widgets/mission_vision.dart';
import 'package:ont_blog/home/widgets/navbar.dart';
import 'package:ont_blog/home/widgets/stadistic.dart';
import 'package:ont_blog/home/widgets/summary.dart';


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
  final GlobalKey MissionKey = GlobalKey();
  final GlobalKey gestionKey = GlobalKey();
  final GlobalKey graphKey = GlobalKey();
  final GlobalKey contactanosKey = GlobalKey();


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset > 5 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 5 && _isScrolled) {
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
        duration: const Duration(milliseconds: 100),
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
                //SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                WidgetImage(scroll: _isScrolled,key: somosOntKey),
                /*WidgetImage1(key: somosOntKey),
                WidgetImage2(),*/
                // Sección de misión, visión, etc.
                WidgetMissionVision(key: MissionKey),

                // Sección de estadísticas
                WidgetStatistic(/*key: publicacionesKey*/),

                // Sección de gráfica y programación financiera
                WidgetGraph(key: publicacionesKey),//WidgetGraph(key: graphKey),

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


/*

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
*/
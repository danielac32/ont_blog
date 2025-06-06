import 'package:flutter/material.dart';
import 'package:ont_blog/home/widgets/contact.dart';
import 'package:ont_blog/home/widgets/graph.dart';
import 'package:ont_blog/home/widgets/header.dart';
import 'package:ont_blog/home/widgets/image.dart';
import 'package:ont_blog/home/widgets/mission_vision.dart';
import 'package:ont_blog/home/widgets/navbar.dart';
import 'package:ont_blog/home/widgets/stadistic.dart';
import 'package:ont_blog/home/widgets/summary.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
            child: Center( // Centra el contenido
              child: Container( // Limita el ancho al 80%
                width: MediaQuery.of(context).size.width ,//* 0.8,
                child: Column(
                  children: [
                    WidgetHeader(),
                    WidgetImage(scroll: _isScrolled, key: somosOntKey),
                    WidgetMissionVision(key: MissionKey),
                   // WidgetStatistic(),
                   // WidgetGraph(key: publicacionesKey),
                    Widget3NumGraph(key: publicacionesKey),
                    WidgetSummary(key: gestionKey),
                    SizedBox(height: 10),
                    //WidgetContact(key: contactanosKey),
                  ],
                ),
              ),
            ),
          ),
          // Navbar fijo en la parte superior
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





class Widget3NumGraph extends StatelessWidget {
   Widget3NumGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1.5,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/bk_bottom.jpg',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.2),
              colorBlendMode: BlendMode.darken,
            ),
          ),

          // Contenido encima de la imagen
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                // Números estadísticos (Organismos, Gobernaciones, Alcaldías)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Statistic(number: '50', label: 'Organismos'),
                    Statistic(number: '23', label: 'Gobernaciones'),
                    Statistic(number: '300', label: 'Alcaldías'),
                  ],
                ),

                 SizedBox(height: MediaQuery.of(context).size.height * 0.2),

                // Gráfico (WidgetGraph)
                GraphChart(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Graph {
  final String name;
  final int num;

  Graph({required this.name, required this.num});
}


class GraphChart extends StatelessWidget {
  final List<Graph> data = [
    Graph(name: 'Dirección Norte', num: 150),
    Graph(name: 'Dirección Sur', num: 200),
    Graph(name: 'Dirección Este', num: 120),
    Graph(name: 'Dirección Oeste', num: 180),
  ];

  GraphChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

          // Gráfico de Torta (Lado izquierdo)
          child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent, // Color azul más intenso
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    "Programación Semanal Financiera",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: SfCircularChart(
                        legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                        series: <CircularSeries>[
                          PieSeries<Graph, String>(
                            dataSource: data,
                            xValueMapper: (Graph item, _) => item.name,
                            yValueMapper: (Graph item, _) => item.num,
                            dataLabelSettings: const DataLabelSettings(isVisible: true),
                            enableTooltip: true,
                          )
                        ],
                      )
                ),
              ],
          )
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
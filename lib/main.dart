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
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/cintillo2.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                Container(
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
                ),
               Container(
                 height: MediaQuery.of(context).size.height * 0.4,
                 decoration: const BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('assets/2.jpeg'), // Reemplaza con tu imagen
                     fit: BoxFit.cover,
                   ),
                 ),
               ),
                // Sección de misión, visión, etc.
                Container(
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
                          _buildInfoCard(
                            context,
                            'MISIÓN',
                            'Nuestra misión es proporcionar soluciones innovadoras y eficientes para el desarrollo organizacional y tecnológico.',
                            Icons.flag,
                          ),
                          _buildInfoCard(
                            context,
                            'VISIÓN',
                            'Ser líderes en transformación digital y gestión organizacional a nivel nacional e internacional.',
                            Icons.visibility,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildInfoCard(
                            context,
                            'VALORES',
                            'Integridad, Innovación, Excelencia, Trabajo en equipo, Responsabilidad social.',
                            Icons.star,
                          ),
                          _buildInfoCard(
                            context,
                            'OBJETIVO',
                            'Fortalecer las capacidades institucionales mediante soluciones tecnológicas y de gestión.',
                            Icons.track_changes,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Sección de estadísticas
                Container(
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
                          _buildStatistic('50', 'Organismos'),
                          _buildStatistic('23', 'Gobernaciones'),
                          _buildStatistic('300', 'Alcaldías'),
                        ],
                      ),
                    ],
                  ),
                ),

                // Sección de gráfica y programación financiera
                Container(
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
                            _buildLegendItem('Presupuesto asignado', Colors.blue),
                            _buildLegendItem('Ejecutado', Colors.green),
                            _buildLegendItem('Pendiente', Colors.orange),
                            _buildLegendItem('Ajustes', Colors.red),
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
                ),

                // Sección de resumen de gestión (cards)
                Container(
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
                          _buildManagementCard(
                            'Proyectos completados',
                            '48',
                            Icons.check_circle,
                            Colors.green,
                          ),
                          _buildManagementCard(
                            'Proyectos en curso',
                            '15',
                            Icons.construction,
                            Colors.orange,
                          ),
                          _buildManagementCard(
                            'Capacitaciones realizadas',
                            '32',
                            Icons.school,
                            Colors.blue,
                          ),
                          _buildManagementCard(
                            'Beneficiarios directos',
                            '1,250',
                            Icons.people,
                            Colors.purple,
                          ),
                          _buildManagementCard(
                            'Aliados estratégicos',
                            '28',
                            Icons.handshake,
                            Colors.teal,
                          ),
                          _buildManagementCard(
                            'Inversión total',
                            '\$2.8M',
                            Icons.attach_money,
                            Colors.green[700]!,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Navbar fijo en la parte superior
          Positioned(
            top: _isScrolled? 0: MediaQuery.of(context).size.height * 0.1,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 80,
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
                      _buildNavItem('Somos ONT', _isScrolled),
                      _buildNavItem('Publicaciones', _isScrolled),
                      _buildNavItem('Gestión', _isScrolled),
                      _buildNavItem('Contáctanos', _isScrolled),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String text, bool isScrolled) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isScrolled ? Colors.blue[800] : Colors.white,
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String title, String content, IconData icon) {
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

  Widget _buildStatistic(String number, String label) {
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

  Widget _buildLegendItem(String text, Color color) {
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

  Widget _buildManagementCard(String title, String value, IconData icon, Color color) {
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
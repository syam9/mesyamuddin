import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Web UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'VictorMono'),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageHeight = screenSize.height < 600
        ? (screenSize.height * 0.8).toDouble()
        : 550.0;

    return Scaffold(
      backgroundColor: const Color(0xFF24232A),
      body: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: BackgroundPatternPainter())),
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: screenSize.width < 600 ? screenSize.width * 0.9 : 420,
                margin: const EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 30,
                      offset: Offset(0, 15),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Stack(
                    children: [
                      // Background Image with fallback
                      Image.asset(
                        'assets/images/syam.png',
                        height: imageHeight,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: imageHeight,
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              'Image not found',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      // Gradient Overlay
                      Container(
                        height: imageHeight,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF0D324D).withOpacity(0.8),
                              Color(0xFF7F5A83).withOpacity(0.8),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                      ),

                      // Content
                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 50),
                            Text(
                              "Hi, I'm Syam\nBuilding connected digital solutions.",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: 20),

                            LayoutBuilder(
                              builder: (context, constraints) {
                                double width = constraints.maxWidth;
                                double responsiveFontSize = width < 400
                                    ? 13
                                    : width < 800
                                        ? 15
                                        : 18;

                                return Text(
                                  '• Founder • Developer • Designer',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: responsiveFontSize,
                                    fontFamily: 'VictorMono',
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.5,
                                    foreground: Paint()
                                      ..shader = LinearGradient(
                                        colors: [
                                          Color(0xFFB36AE2),
                                          Color(0xFFFA8B61),
                                        ],
                                      ).createShader(
                                        Rect.fromLTWH(0.0, 0.0, 300.0, 50.0),
                                      ),
                                  ),
                                );
                              },
                            ),

                            SizedBox(height: 32),

                            _customButton(
                              label: 'Portfolio',
                              onTap: () =>
                                  _launchUrl('https://hexa-freedom.netlify.app'),
                            ),

                            SizedBox(height: 10),

                            _customButton(
                              label: 'Contact Number',
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor: Color(0xFF2E2C36),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '+601118872966',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'VictorMono',
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: TextButton.icon(
                                              onPressed: () {
                                                Clipboard.setData(
                                                  ClipboardData(
                                                    text: '+601118872966',
                                                  ),
                                                );
                                                Navigator.of(context).pop();
                                              },
                                              icon: Icon(Icons.copy,
                                                  color: Colors.white),
                                              label: Text('Copy',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),

                            SizedBox(height: 10),

                            _customButton(
                              label: 'WhatsApp Me',
                              onTap: () =>
                                  _launchUrl('https://wa.me/+601118872966'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Social Icons
          Positioned(
            bottom: screenSize.height / 5.5,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialIcon(() => _launchUrl('https://instagram.com/syam0x'),
                    Icons.camera_alt),
                SizedBox(width: 30),
                _socialIcon(() => _launchUrl('https://facebook.com/Mesyamudin'),
                    Icons.facebook),
                SizedBox(width: 30),
                _socialIcon(() => _launchUrl('mailto:mesyamuddin@gmail.com'),
                    Icons.mail),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _customButton({required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'VictorMono',
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialIcon(VoidCallback onTap, IconData icon) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: Colors.white),
    );
  }
}

class BackgroundPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange.withOpacity(0.05)
      ..strokeWidth = 1;

    const spacing = 50.0;

    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawLine(Offset(x - 5, y), Offset(x + 5, y), paint);
        canvas.drawLine(Offset(x, y - 5), Offset(x, y + 5), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


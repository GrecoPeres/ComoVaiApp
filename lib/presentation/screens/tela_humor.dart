import 'package:como_vai/presentation/screens/tela_integracao.dart';
import 'package:flutter/material.dart';
import 'package:como_vai/constants/colors.dart';
import 'package:como_vai/data/humor_data.dart';

class MoodScreen extends StatefulWidget {
  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  OnboardingScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(-1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Positioned(
                  top: 16,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Estatísticas',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                              backgroundColor: Colors.grey.shade200,
                            ),
                            onPressed: () {},
                            child: Icon(Icons.arrow_back_ios),
                          ),
                          Text(
                            '11 a 17 de Outubro',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                              backgroundColor: Colors.grey.shade200,
                            ),
                            onPressed: () {},
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  top: 130,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: ListView.builder(
                      itemCount: moodData.length,
                      itemBuilder: (context, index) {
                        final mood = moodData[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: _getMoodColor(index),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${11 + index}',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      _getDayOfWeek(index),
                                      style: TextStyle(
                                        fontSize: 28,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  mood.image,
                                  height: 80,
                                  width: 80,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getMoodColor(int index) {
    switch (index) {
      case 0:
        return AppColors.pink;
      case 1:
        return AppColors.yellow;
      case 2:
        return AppColors.blue;
      case 3:
        return AppColors.indigo;
      case 4:
        return AppColors.orange;
      default:
        return AppColors.orange;
    }
  }

  String _getDayOfWeek(int index) {
    switch (index) {
      case 0:
        return 'Segunda-feira';
      case 1:
        return 'Terça-feira';
      case 2:
        return 'Quarta-feira';
      case 3:
        return 'Quinta-feira';
      case 4:
        return 'Sexta-feira';
      case 5:
        return 'Sábado';
      default:
        return 'Desconhecido';
    }
  }
}

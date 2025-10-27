import 'package:beaute_naturelle/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<OnboardingPage> {
  bool _isTapped = false;

  // Base animation duration (now longer!)
  Duration get _duration => Duration(milliseconds: 900);
  Duration get _shortDuration => Duration(milliseconds: 600);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!_isTapped) {
          setState(() {
            _isTapped = true;
          });
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: 430,
                height: 932,
                child: Stack(
                  children: [
                    // Yellow blob — fade + slight scale
                    AnimatedOpacity(
                      opacity: _isTapped ? 1.0 : 0.0,
                      duration: _duration,
                      curve: Curves.easeOut,
                      child: AnimatedScale(
                        scale: _isTapped ? 1.0 : 0.9,
                        duration: _duration,
                        curve: Curves.easeOutBack,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            'assets/yellow_blob.svg',
                            height: 932 * 0.2,
                          ),
                        ),
                      ),
                    ),

                    // Green blob — fade + slight scale (slightly delayed feel via same curve)
                    AnimatedOpacity(
                      opacity: _isTapped ? 1.0 : 0.0,
                      duration: _duration,
                      curve: Curves.easeOut,
                      child: AnimatedScale(
                        scale: _isTapped ? 1.0 : 0.85,
                        duration: _duration,
                        curve: Curves.easeOutBack,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            'assets/blopvert.svg',
                            height: 932 * 0.23,
                          ),
                        ),
                      ),
                    ),

                    // Top-right airplane — static (no change)
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 932 * 0.07,
                          right: 430 * 0.05,
                        ),
                        child: SvgPicture.asset('assets/airplane.svg'),
                      ),
                    ),

                    // Clouds — animate in (even though they exist before, we’ll make them "settle")
                    AnimatedOpacity(
                      opacity: _isTapped ? 1.0 : 0.7,
                      duration: _shortDuration,
                      curve: Curves.easeInOut,
                      child: AnimatedAlign(
                        alignment: Alignment(0.6, -0.88),
                        duration: _shortDuration,
                        curve: Curves.easeOut,
                        child: SvgPicture.asset(
                          'assets/cloud.svg',
                          height: 932 * 0.025,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: _isTapped ? 1.0 : 0.7,
                      duration: _shortDuration,
                      curve: Curves.easeInOut,
                      child: AnimatedAlign(
                        alignment: Alignment(0.75, -0.95),
                        duration: _shortDuration,
                        curve: Curves.easeOut,
                        child: SvgPicture.asset(
                          'assets/cloud.svg',
                          height: 932 * 0.015,
                        ),
                      ),
                    ),

                    // Onboarding lines — subtle scale
                    AnimatedScale(
                      scale: _isTapped ? 1.0 : 0.95,
                      duration: _duration,
                      curve: Curves.easeOut,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 430 * 0.2),
                          child: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: SvgPicture.asset(
                              'assets/onboarding_lines.svg',
                              fit: BoxFit.contain,
                              height: 932 * 0.6,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // "Discover" text
                    AnimatedAlign(
                      alignment: _isTapped ? Alignment(-1, 0.09) : Alignment(0, 0.8),
                      duration: _duration,
                      curve: Curves.easeOut,
                      child: SizedBox(
                        width: 430 * 0.5,
                        child: Padding(
                          padding: EdgeInsets.only(left: 430 * 0.04),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedDefaultTextStyle(
                                style: TextStyle(
                                  fontSize: 430 * (_isTapped ? 0.075 : 0.08),
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textGreen,
                                  fontFamily: 'LEMON',
                                ),
                                duration: _duration,
                                child: Text("Discover"),
                              ),
                              AnimatedSize(
                                duration: Duration(milliseconds: 400),
                                child: SizedBox(height: _isTapped ? 0 : 8),
                              ),
                              AnimatedDefaultTextStyle(
                                style: TextStyle(
                                  fontSize: 430 * (_isTapped ? 0.045 : 0.05),
                                  color: Colors.grey[700],
                                  fontFamily: 'LEMON',
                                ),
                                duration: _duration,
                                child: Text(
                                  "the beauty\nsecret of every\nculture",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Initial large bowl — fade out + scale down
                    AnimatedOpacity(
                      opacity: _isTapped ? 0.0 : 1.0,
                      duration: _shortDuration,
                      curve: Curves.easeIn,
                      child: AnimatedAlign(
                        alignment: Alignment(0.15, 0.03),
                        duration: _shortDuration,
                        curve: Curves.easeIn,
                        child: Transform.rotate(
                          angle: -0.7,
                          child: SvgPicture.asset(
                            'assets/fondderrierelebol.svg',
                            height: 932 * 0.37,
                          ),
                        ),
                      ),
                    ),

                    // Matcha bowl + heart — fade out
                    AnimatedOpacity(
                      opacity: _isTapped ? 0.0 : 1.0,
                      duration: _shortDuration,
                      curve: Curves.easeIn,
                      child: Align(
                        alignment: Alignment(0.5, 0.35),
                        child: SizedBox(
                          width: 430 * 0.4,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment(0, 0.07),
                                child: Image.asset(
                                  'assets/matcha_bowl.gif',
                                  height: 932 * 0.13,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Align(
                                alignment: Alignment(-0.6, -0.07),
                                child: SvgPicture.asset(
                                  'assets/heart1.svg',
                                  height: 932 * 0.03,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Onboarding-style small bowl — fade in + slight move
                    AnimatedOpacity(
                      opacity: _isTapped ? 1.0 : 0.0,
                      duration: _duration,
                      curve: Curves.easeOut,
                      child: AnimatedAlign(
                        alignment: Alignment(0.5, 0.35),
                        duration: _duration,
                        curve: Curves.easeOut,
                        child: SizedBox(
                          width: 430 * 0.4,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment(1.2, 0.01),
                                child: SvgPicture.asset(
                                  'assets/fondderrierelebol.svg',
                                  height: 932 * 0.15,
                                ),
                              ),
                              Align(
                                alignment: Alignment(-1.4, -0.15),
                                child: SvgPicture.asset(
                                  'assets/heart.svg',
                                  height: 932 * 0.03,
                                ),
                              ),
                              Align(
                                alignment: Alignment(-0.7, -0.06),
                                child: SvgPicture.asset(
                                  'assets/heart.svg',
                                  height: 932 * 0.03,
                                ),
                              ),
                              Align(
                                alignment: Alignment(-0.6, -0.07),
                                child: SvgPicture.asset(
                                  'assets/heart1.svg',
                                  height: 932 * 0.03,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Planet — fade in + scale from center
                    AnimatedOpacity(
                      opacity: _isTapped ? 1.0 : 0.0,
                      duration: _duration,
                      curve: Curves.easeOut,
                      child: AnimatedScale(
                        scale: _isTapped ? 1.0 : 0.6,
                        duration: _duration,
                        curve: Curves.easeOutBack,
                        child: Align(
                          alignment: Alignment(1.1, 0.04),
                          child: SvgPicture.asset('assets/planete.svg'),
                        ),
                      ),
                    ),

                    // "Explore" text
                    AnimatedAlign(
                      alignment: _isTapped ? Alignment(0.8, -0.3) : Alignment(0, -0.8),
                      duration: _duration,
                      curve: Curves.easeOut,
                      child: SizedBox(
                        width: 430 * (_isTapped ? 0.6 : 0.8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedDefaultTextStyle(
                              style: TextStyle(
                                fontSize: 430 * (_isTapped ? 0.075 : 0.08),
                                fontWeight: FontWeight.bold,
                                color: AppColors.textGreen,
                                fontFamily: 'LEMON',
                              ),
                              duration: _duration,
                              child: Text("Explore"),
                            ),
                            AnimatedDefaultTextStyle(
                              style: TextStyle(
                                fontSize: 430 * (_isTapped ? 0.045 : 0.05),
                                color: Colors.grey[700],
                                fontFamily: 'LEMON',
                              ),
                              duration: _duration,
                              child: Text("the world of beauty"),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bottom-left airplane — static
                    Align(
                      alignment: Alignment(-0.95, 0.67),
                      child: Transform.rotate(
                        angle: -0.1,
                        child: SvgPicture.asset(
                          'assets/airplane.svg',
                          height: 932 * 0.05,
                        ),
                      ),
                    ),

                    // Button — fade + scale (correct alignment!)
                    AnimatedOpacity(
                      opacity: _isTapped ? 1.0 : 0.0,
                      duration: _duration,
                      curve: Curves.easeOut,
                      child: AnimatedScale(
                        scale: _isTapped ? 1.0 : 0.7,
                        duration: _duration,
                        curve: Curves.easeOutBack,
                        child: Align(
                          alignment: Alignment(0.0, 0.7),
                          child: SizedBox(
                            width: 430 * 0.65,
                            height: 932 * 0.06,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle action
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF534C4B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(26),
                                ),
                              ),
                              child: Text(
                                "I am starting my trip",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 430 * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Left leaf — animate size & opacity slightly
                    AnimatedOpacity(
                      opacity: _isTapped ? 0.95 : 1.0,
                      duration: _shortDuration,
                      curve: Curves.easeInOut,
                      child: AnimatedContainer(
                        duration: _shortDuration,
                        curve: Curves.easeInOut,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 430 * 0.05),
                            child: SvgPicture.asset(
                              'assets/leaf_branch_left.svg',
                              height: 932 * (_isTapped ? 0.1 : 0.12),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Right leaf — fade out completely
                    AnimatedOpacity(
                      opacity: _isTapped ? 0.0 : 1.0,
                      duration: _shortDuration,
                      curve: Curves.easeIn,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 430 * 0.02),
                          child: SvgPicture.asset(
                            'assets/leaf_branch_right.svg',
                            height: 932 * 0.1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
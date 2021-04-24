import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

const _linkedInUrl = 'https://www.linkedin.com/in/heeyunlee/';
const _githubUrl = 'https://github.com/heeyunlee';
const _emailUrl = 'mailto:info@heeyunlee.com';
const _heraklessUrl = 'https://www.nextsportif.com/';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // AnimationController _iconAnimationController;
  // bool _isMenuOpened = false;

  AnimationController _colorAnimationController;
  AnimationController _textAnimationController;

  Animation _colorTween;
  Animation<Offset> _transTween;

  double firstLayerPosition = 200;
  double secondLayerPosition = 200;
  double thirdLayerPosition = 220;
  double fourthLayerPosition = 320;
  double fifthLayerPosition = 300;

  double textPosition = 200;

  @override
  void initState() {
    super.initState();
    _colorAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 0),
    );
    _textAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 0),
    );

    _colorTween = ColorTween(begin: Colors.transparent, end: AppBarColor)
        .animate(_colorAnimationController);
    _transTween = Tween(begin: Offset(0, -40), end: Offset(0, 0))
        .animate(_textAnimationController);
    // _iconAnimationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 150),
    // );
  }

  @override
  void dispose() {
    _colorAnimationController.dispose();
    _textAnimationController.dispose();
    // _iconAnimationController.dispose();
    super.dispose();
  }

  bool _scrollListener(ScrollNotification scrollNotifier) {
    if (scrollNotifier is ScrollUpdateNotification) {
      _colorAnimationController
          .animateTo((scrollNotifier.metrics.pixels - 800) / 50);
      _textAnimationController
          .animateTo((scrollNotifier.metrics.pixels - 800) / 50);

      final delta = scrollNotifier.scrollDelta;

      setState(() {
        firstLayerPosition -= delta / 1;
        secondLayerPosition -= delta / 1.5;
        thirdLayerPosition -= delta / 2;
        fourthLayerPosition -= delta / 2.5;
        fifthLayerPosition -= delta / 3;

        textPosition -= delta / 6;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: AnimatedBuilder(
          animation: _colorAnimationController,
          builder: (context, child) => AppBar(
            backgroundColor: _colorTween.value,
            elevation: 0,
            centerTitle: true,
            title: Transform.translate(
              offset: _transTween.value,
              child: const Text('Heeyun Lee', style: Subtitle1),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => launch(_linkedInUrl),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                ),
                child: SvgPicture.asset(
                  'assets/icons/linkedIn.svg',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () => launch(_githubUrl),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                ),
                child: SvgPicture.asset(
                  'assets/icons/github.svg',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                ),
                child: FaIcon(FontAwesomeIcons.envelope, color: Colors.white),
                onPressed: () => launch(_emailUrl),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
      backgroundColor: BackgroundColor,
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color(0xffF9E0BB),
                      Color(0xffF0B051),
                    ]),
              ),
            ),
            Positioned(
              top: textPosition,
              left: size.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hello, I\'m', style: Headline5Black),
                  const Text('Heeyun Lee', style: Headline4Black),
                  const SizedBox(height: 16),
                  const Text(
                    'Flutter Developer,\nFinance and business analytics student.',
                    style: Headline6Black,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: SvgPicture.asset(
                'assets/images/6th_layer.svg',
                width: size.width * 1.5,
              ),
            ),
            Positioned(
              top: fifthLayerPosition,
              child: SvgPicture.asset(
                'assets/images/5th_layer.svg',
                width: size.width * 1.02,
              ),
            ),
            Positioned(
              top: fourthLayerPosition,
              child: SvgPicture.asset(
                'assets/images/4th_layer.svg',
                width: size.width * 1.02,
              ),
            ),
            Positioned(
              top: thirdLayerPosition,
              child: SvgPicture.asset(
                'assets/images/3rd_layer.svg',
                width: size.width * 1.02,
              ),
            ),
            Positioned(
              top: secondLayerPosition,
              child: SvgPicture.asset(
                'assets/images/2nd_layer.svg',
                width: size.width * 1.02,
              ),
            ),
            Positioned(
              top: firstLayerPosition,
              child: SvgPicture.asset(
                'assets/images/1st_layer.svg',
                width: size.width,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 8,
              child: Text(
                'Illustration by Terd486 and axellwolf from Adobe Stock',
                style: Caption1,
              ),
            ),
            ListView(
              children: [
                Container(
                  height: size.height,
                  color: Colors.transparent,
                ),
                Container(
                  // color: Colors.blueGrey[900],
                  color: Colors.black,
                  height: 4000,
                  child: Padding(
                    padding: EdgeInsets.all(size.width / 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('About Me', style: Headline4Condensed),
                        const SizedBox(height: 24),
                        const Text(
                          'I\'m a self-taught Flutter Developer, currently stuyding Finance and Business Analytics at Pace University.',
                          style: Headline6Grey,
                        ),
                        SizedBox(height: 48),
                        Text('Projects', style: Headline4Condensed),
                        SizedBox(height: 24),

                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('HēraKless', style: Headline3),
                                SizedBox(height: 8),
                                Text(
                                  'Workout Tracking Application',
                                  style: Headline6Grey,
                                ),
                              ],
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () => launch(_heraklessUrl),
                              onHover: (hovering) {
                                print('hovering is $hovering');
                              },
                              child: SizedBox(
                                width: size.width / 2,
                                height: 400,
                                child: Card(
                                  elevation: 6,
                                  color: Colors.deepPurple,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset(
                                    'assets/images/project_preview.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 40,
                        //   width: 160,
                        //   child: Card(
                        //     shape: Border(
                        //       bottom: BorderSide(color: Colors.white, width: 2),
                        //       top: BorderSide(color: Colors.white, width: 2),
                        //     ),
                        //     elevation: 4,
                        //     color: Color(0xff005301),
                        //     child: Stack(
                        //       children: [
                        //         Center(
                        //           child: FittedBox(
                        //             child: Text(
                        //               '2021',
                        //               style: Headline5,
                        //             ),
                        //           ),
                        //         ),
                        //         Positioned(
                        //           top: 4,
                        //           right: 4,
                        //           child: Text('ST', style: BodyText2Condensed),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Spacer(),
                        // const SizedBox(height: 48),
                        // FooterWidget(),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

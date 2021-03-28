import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_app/footer_widget.dart';

import 'constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _animationController;

  bool isMenuOpened = false;
  double eighthLayerPosition = 0;
  double seventhLayerPosition = -300;
  double sixthLayerPosition = -150;
  double fifthLayerPosition = -140;
  double fourthLayerPosition = -130;
  double thirdLayerPosition = -120;
  double secondLayerPosition = -110;
  double firstLayerPosition = -100;

  double textPosition = 40;

  final items = List<String>.generate(10, (i) => "Item $i");

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _scrollListener(ScrollNotification scrollNotifier) {
    if (scrollNotifier is ScrollUpdateNotification) {
      final delta = scrollNotifier.scrollDelta;

      setState(() {
        eighthLayerPosition -= delta / 7;
        seventhLayerPosition -= delta / 4;
        sixthLayerPosition -= delta / 3.5;
        fifthLayerPosition -= delta / 3;
        fourthLayerPosition -= delta / 2.5;
        thirdLayerPosition -= delta / 2;
        secondLayerPosition -= delta / 1.5;
        firstLayerPosition -= delta / 1;

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
                      Color(0xff64c4f4),
                      Color(0xffbcd4dc),
                    ]),
              ),
            ),
            Positioned(
              top: eighthLayerPosition,
              right: -170,
              child: SvgPicture.asset(
                'assets/images/clouds.svg',
                // width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: size.width / 8,
              top: textPosition,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hello, I\'m', style: Headline5Black),
                  const Text('Heeyun Lee', style: Headline4Black),
                  const SizedBox(height: 16),
                  const SizedBox(
                    width: 250,
                    child: Text(
                      'I\'m a student who likes to learn new things and build amazing stuff. \n\nOnly recently I\'ve discovered Flutter, but I\'ve been having so much fun learning and building new things',
                      style: Headline6Black,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: seventhLayerPosition,
              child: SvgPicture.asset(
                'assets/images/7th_layer.svg',
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: sixthLayerPosition,
              child: SvgPicture.asset(
                'assets/images/6th_layer.svg',
                width: size.width,
                fit: BoxFit.cover,
                color: Colors.blueGrey[300],
              ),
            ),
            Positioned(
              top: fifthLayerPosition,
              child: SvgPicture.asset(
                'assets/images/5th_layer.svg',
                width: size.width,
                fit: BoxFit.cover,
                color: Colors.blueGrey[400],
              ),
            ),
            Positioned(
              top: fourthLayerPosition,
              child: SvgPicture.asset(
                'assets/images/4th_layer.svg',
                width: size.width,
                fit: BoxFit.cover,
                color: Colors.blueGrey[500],
              ),
            ),
            Positioned(
              top: thirdLayerPosition,
              child: SvgPicture.asset(
                'assets/images/3rd_layer.svg',
                width: size.width,
                fit: BoxFit.cover,
                color: Colors.blueGrey[700],
              ),
            ),
            Positioned(
              top: secondLayerPosition,
              child: SvgPicture.asset(
                'assets/images/2nd_layer.svg',
                width: size.width,
                fit: BoxFit.cover,
                color: Colors.blueGrey[800],
              ),
            ),
            Positioned(
              top: firstLayerPosition,
              child: SvgPicture.asset(
                'assets/images/1st_layer.svg',
                width: size.width,
                fit: BoxFit.cover,
                color: Colors.blueGrey[900],
              ),
            ),
            ListView(
              children: [
                Container(
                  height: size.height,
                  color: Colors.transparent,
                ),
                Container(
                  color: Colors.blueGrey[900],
                  height: 4000,
                  child: Padding(
                    padding: EdgeInsets.all(size.width / 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('About Me', style: Headline4Condensed),
                        SizedBox(height: 24),
                        Text(
                          'I\'m a self-taught Flutter Developer, currently stuyding Finance and Business Analytics at Pace University.',
                          style: Headline6Grey,
                        ),
                        SizedBox(height: 48),
                        Text('Projects', style: Headline4Condensed),
                        SizedBox(height: 24),
                        StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) =>
                              new Container(
                                  color: Colors.green,
                                  child: new Center(
                                    child: new CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: new Text('$index'),
                                    ),
                                  )),
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.count(2, index.isEven ? 2 : 1),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                        // Row(
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Text('PLAYER H', style: Headline3),
                        //         SizedBox(height: 8),
                        //         Text(
                        //           'Workout Tracking Application',
                        //           style: Headline6Grey,
                        //         ),
                        //       ],
                        //     ),
                        //     Spacer(),
                        //     SizedBox(
                        //       width: size.width / 2,
                        //       height: 400,
                        //       child: Card(
                        //         elevation: 6,
                        //         color: Colors.deepPurple,
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(15),
                        //         ),
                        //         child: Text('asda'),
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
                        FooterWidget(),
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

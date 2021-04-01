import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

const _linkedInUrl = 'https://www.linkedin.com/in/heeyunlee/';
const _githubUrl = 'https://github.com/heeyunlee';
const _emailUrl = 'mailto:info@heeyunlee.com';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'Made by Heeyun Lee using Flutter',
            style: BodyText1Grey,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


const PrimaryCol = Color(0xFF343D6B); //Headline color

const SecondryCol = Color(0xFF545454); //dark grey

const Hiddentextcol = Color(0xFF8F8E94); //light grey

final TextStyle HeadlineTS = TextStyle(
  //Headline Text Style
  fontFamily: 'Montserrat-ExtraBold',
  color: PrimaryCol,
  fontSize: 48.0,
  fontWeight: FontWeight.w700,
);

final TextButton SkipButton = TextButton(
  onPressed: () {},
  child: const Text(
    'Skip',
    style: TextStyle(
      color: PrimaryCol,
      fontFamily: 'Montserrat-ExtraBold',
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);
const TextStyle termsstyle = TextStyle(
  color: Color(0xFF545454),
  fontSize: 15.0,
  fontFamily: 'Montserrat-Bold',
  fontWeight: FontWeight.w500,
);

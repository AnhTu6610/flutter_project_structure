import 'package:flutter/material.dart';
import 'package:flutter_project_structure/resource/colors_data.dart';
import 'package:flutter_project_structure/resource/fonts_name.dart';
import 'package:flutter_project_structure/resource/fonts_size.dart';

class TextsStyle {
  static TextStyle titleAppBar = TextStyle(
    color: ColorsData.appBarText,
    fontFamily: FontsName.medium,
    fontSize: FontsSize.appBar,
  );
  static TextStyle titleLogin = TextStyle(
    color: ColorsData.textTitle,
    fontFamily: FontsName.semiBold,
    fontSize: 26,
  );
  static TextStyle title = TextStyle(
    color: ColorsData.textTitle,
    fontFamily: FontsName.semiBold,
    fontSize: FontsSize.title,
  );
  static TextStyle subTitle = TextStyle(
    color: ColorsData.textSubTitle,
    fontFamily: FontsName.medium,
    fontSize: FontsSize.subTitle,
  );
  static TextStyle heading = TextStyle(
    color: ColorsData.textHeading,
    fontFamily: FontsName.medium,
    fontSize: FontsSize.heading,
  );
  static TextStyle fadedText = TextStyle(
    color: ColorsData.textFaded,
    fontFamily: FontsName.medium,
    fontSize: FontsSize.heading,
  );
  static TextStyle caption = TextStyle(
    color: ColorsData.textCaption,
    fontFamily: FontsName.light,
    fontSize: FontsSize.caption,
    fontStyle: FontStyle.italic,
  );
  static TextStyle lyrics = TextStyle(
    color: ColorsData.textLyrics,
    fontFamily: FontsName.regular,
    fontSize: FontsSize.lyrics,
  );
  static TextStyle subject = TextStyle(
    color: ColorsData.textSubject,
    fontFamily: FontsName.medium,
    fontSize: FontsSize.subject,
  );
  static TextStyle content = TextStyle(
    color: ColorsData.textConten,
    fontFamily: FontsName.regular,
    fontSize: FontsSize.conten,
  );
}

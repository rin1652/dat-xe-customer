// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'constants.dart';

const String FONT_FAMILY_CABIN = "Cabin";

const FONT_SIZE_SMALL = 16.0;
const FONT_SIZE_MEDIUM = 18.0;
const FONT_SIZE_LARGE = 22.0;

const TEXT_HEIGHT = 1.2;

//16
const STYLE_SMALL = TextStyle(
    fontSize: FONT_SIZE_SMALL,
    color: NEUTRAL_BLACK_COLOR,
    height: TEXT_HEIGHT,
    fontFamily: FONT_FAMILY_CABIN);
//18
const STYLE_MEDIUM = TextStyle(
    fontSize: FONT_SIZE_MEDIUM,
    color: NEUTRAL_BLACK_COLOR,
    height: TEXT_HEIGHT,
    fontFamily: FONT_FAMILY_CABIN);

//22
const STYLE_LARGE = TextStyle(
    fontSize: FONT_SIZE_LARGE,
    color: NEUTRAL_BLACK_COLOR,
    height: TEXT_HEIGHT,
    fontFamily: FONT_FAMILY_CABIN);

//16 bold
const STYLE_SMALL_BOLD = TextStyle(
    fontSize: FONT_SIZE_SMALL,
    height: TEXT_HEIGHT,
    fontFamily: FONT_FAMILY_CABIN,
    color: NEUTRAL_BLACK_COLOR,
    fontWeight: FontWeight.bold);
//18 bold
const STYLE_MEDIUM_BOLD = TextStyle(
    fontSize: FONT_SIZE_MEDIUM,
    color: NEUTRAL_BLACK_COLOR,
    height: TEXT_HEIGHT,
    fontFamily: FONT_FAMILY_CABIN,
    fontWeight: FontWeight.bold);
//22 bold
const STYLE_LARGE_BOLD = TextStyle(
    fontSize: FONT_SIZE_LARGE,
    color: NEUTRAL_BLACK_COLOR,
    height: TEXT_HEIGHT,
    fontFamily: FONT_FAMILY_CABIN,
    fontWeight: FontWeight.bold);

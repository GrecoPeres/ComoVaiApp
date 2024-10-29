// lib/models/humor_data.dart

import 'package:flutter/material.dart';

class MoodData {
  final String asset; 
  final String moodText;
  final Color moodColor;
  final String buttonText;
  final String image;

  MoodData({
    required this.asset,
    required this.moodText,
    required this.moodColor,
    required this.buttonText,
    required this.image, 
  });
}

final List<MoodData> moodData = [
  MoodData(
    asset: 'assets/verygood.json',
    moodText: 'Muito bem!',
    moodColor: Colors.black, 
    buttonText: 'Selecionar',
    image: 'assets/emojis/verygood.png', 
  ),
  MoodData(
    asset: 'assets/good.json',
    moodText: 'Bem!',
    moodColor: Colors.black,
    buttonText: 'Selecionar',
    image: 'assets/emojis/good.png', 
  ),
  MoodData(
    asset: 'assets/notgood.json',
    moodText: 'Nada bem...',
    moodColor: Colors.black,
    buttonText: 'Selecionar',
    image: 'assets/emojis/notgood.png', 
  ),
  MoodData(
    asset: 'assets/awful.json',
    moodText: 'Horrível!',
    moodColor: Colors.black,
    buttonText: 'Selecionar',
    image: 'assets/emojis/awful.png', 
  ),
  MoodData(
    asset: 'assets/angry.json',
    moodText: 'Nervoso(a)!',
    moodColor: Colors.black,
    buttonText: 'Selecionar',
    image: 'assets/emojis/angry.png', 
  ),
];

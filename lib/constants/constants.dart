import 'package:assessment_zuhayrnoor/models/allBreeds.dart';
import 'package:assessment_zuhayrnoor/models/imageByBreed.dart';
import 'package:assessment_zuhayrnoor/models/listOfAllSubBreedImages.dart';
import 'package:assessment_zuhayrnoor/models/listOfSubBreeds.dart';
import 'package:assessment_zuhayrnoor/models/randomDogImage.dart';
import 'package:assessment_zuhayrnoor/models/randomImageByBreed.dart';
import 'package:flutter/material.dart';

Color white = Colors.white;
Color black = Colors.black;
Color brown = const Color.fromARGB(255, 54, 38, 32);

AllBreeds allBreedsModel = AllBreeds();
AllBreeds allBreedsModelBackup = AllBreeds();
RandomDogImage randomDogImageModel = RandomDogImage();
ImageByBreed imageByBreed = ImageByBreed();
RandomImageByBreed randomImageByBreed = RandomImageByBreed();
ListOfSubBreeds listOfSubBreeds = ListOfSubBreeds();
ListOfAllSubBreedsImages listOfAllSubBreedsImages = ListOfAllSubBreedsImages();
late String randomDogImage;
TextEditingController searchController = TextEditingController();
TextEditingController searchSubBreedsController = TextEditingController();

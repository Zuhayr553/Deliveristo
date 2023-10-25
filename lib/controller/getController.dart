import 'dart:convert';

import 'package:assessment_zuhayrnoor/constants/constants.dart';
import 'package:assessment_zuhayrnoor/models/allBreeds.dart';
import 'package:assessment_zuhayrnoor/models/imageByBreed.dart';
import 'package:assessment_zuhayrnoor/models/listOfAllSubBreedImages.dart';
import 'package:assessment_zuhayrnoor/models/listOfSubBreeds.dart';
import 'package:assessment_zuhayrnoor/models/randomDogImage.dart';
import 'package:assessment_zuhayrnoor/models/randomImageByBreed.dart';
import 'package:http/http.dart' as http;

class getQuery {
  getAllBreeds() async {
    var request =
        http.Request('GET', Uri.parse('https://dog.ceo/api/breeds/list/all'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseData = await response.stream.bytesToString();
      var jsonDecoded = jsonDecode(responseData);
      if (jsonDecoded['status'] == 'success') {
        allBreedsModel = AllBreeds.fromJson(jsonDecoded);
        allBreedsModelBackup = AllBreeds.fromJson(jsonDecoded);
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  getARandomImage() async {
    var request = http.Request(
        'GET', Uri.parse('https://dog.ceo/api/breeds/image/random'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      randomDogImageModel = RandomDogImage.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print(response.reasonPhrase);
    }
  }

  imageByBreedOfDog(String breed) async {
    var request = http.Request(
        'GET', Uri.parse('https://dog.ceo/api/breed/$breed/images'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      imageByBreed = ImageByBreed.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<String> randomImageByBreedOfDog(String breed) async {
    var request = http.Request(
        'GET', Uri.parse('https://dog.ceo/api/breed/$breed/images/random'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      randomImageByBreed = RandomImageByBreed.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      return randomImageByBreed.message ?? ' ';
    } else {
      print(response.reasonPhrase);
      return '';
    }
  }

  Future<String> randomImageByBreedAndSubBreedOfDog(
      String breed, String subBreed) async {
    var request = http.Request('GET',
        Uri.parse('https://dog.ceo/api/breed/$breed/$subBreed/images/random'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      randomImageByBreed = RandomImageByBreed.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      return randomImageByBreed.message ?? ' ';
    } else {
      print(response.reasonPhrase);
      return '';
    }
  }

  listOfSubBreedsOfADog(String breed) async {
    var request =
        http.Request('GET', Uri.parse('https://dog.ceo/api/breed/$breed/list'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      listOfSubBreeds = ListOfSubBreeds.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print(response.reasonPhrase);
    }
  }

  listOfAllSubBreedImages(String breed, String subBreed) async {
    var request = http.Request(
        'GET', Uri.parse('https://dog.ceo/api/breed/$breed/$subBreed/images'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      listOfAllSubBreedsImages = ListOfAllSubBreedsImages.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print(response.reasonPhrase);
    }
  }
}

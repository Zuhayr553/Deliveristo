import 'package:assessment_zuhayrnoor/constants/constants.dart';
import 'package:assessment_zuhayrnoor/constants/extractedMethods.dart';
import 'package:assessment_zuhayrnoor/constants/showtoast.dart';
import 'package:assessment_zuhayrnoor/controller/getController.dart';
import 'package:assessment_zuhayrnoor/models/allBreeds.dart';
import 'package:assessment_zuhayrnoor/views/moreImagesOfABreed.dart';
import 'package:assessment_zuhayrnoor/views/viewSubBreeds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.06,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Deliveristo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26, color: brown, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              buildSearchBar(searchController, updateSearchResult),
              allBreedsModel.message?.length == 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 24),
                      child: Text(
                        'Could Not Find Anything For What You Searched',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            color: black,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Two items in each row
                          crossAxisSpacing: Get.width *
                              0.04, // Space between items in the row
                          mainAxisSpacing: Get.height * 0.02,
                          mainAxisExtent:
                              Get.height * 0.43 // Space between rows
                          ),
                      itemCount: allBreedsModel.message?.length ??
                          0, // Total number of items
                      itemBuilder: (BuildContext context, int index) {
                        print(allBreedsModel.message!.entries);

                        return Container(
                          decoration: boxDecorationForMainCardHomePage(),
                          height:
                              Get.height * 0.5, // Adjust the height as needed
                          width: Get.width * 0.35,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12),
                          child: FutureBuilder<String>(
                            future: getQuery().randomImageByBreedOfDog(
                                allBreedsModel.message!.keys.elementAt(index)),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return customCircularPogressIndicatorCentered(
                                    white); // Show a circular progress indicator while fetching
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return Center(
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            12.0), // Adjust the radius as needed
                                        child: Image.network(
                                          snapshot.data!,
                                          height: Get.height * 0.2,
                                          width: Get.width * 0.32,
                                          fit: BoxFit.cover,
                                        ),
                                      ), // Use the fetched image
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      Text(
                                        allBreedsModel.message!.keys
                                            .elementAt(index),
                                        style: TextStyle(
                                            color: white, fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      customButtomContainerInsideMainCard(() {
                                        Get.to(GetImagesByBreed(
                                            breedName: allBreedsModel
                                                .message!.keys
                                                .elementAt(index)));
                                      }, 'View More Images'),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      customButtomContainerInsideMainCard(() {
                                        print(allBreedsModel.message!.values
                                            .elementAt(index) is List);
                                        if (allBreedsModel.message!.values
                                                .elementAt(index)
                                                .length !=
                                            0) {
                                          List namesOfSubbreeds = [];
                                          for (var i in allBreedsModel
                                              .message!.values
                                              .elementAt(index)) {
                                            namesOfSubbreeds.add(i);
                                          }
                                          Get.to(ViewSubBreeds(
                                            namesOfSubbreeds: namesOfSubbreeds,
                                            nameOfBreed: allBreedsModel
                                                .message!.keys
                                                .elementAt(index),
                                          ));
                                        } else {
                                          showToasterror(
                                              'No Sub Breeds Exists For This Dog!');
                                        }
                                      }, 'View Sub Breeds'),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }

  void updateSearchResult(String searchText) {
    setState(() {
      print(searchText);
      if (searchText.trim() != '') {
        Map<String, dynamic> filteredEntries = Map.fromEntries(
          allBreedsModelBackup.message!.entries.where(
            (element) => element.key.contains(searchText.trim()),
          ),
        );
        allBreedsModel.message = filteredEntries;
      } else {
        allBreedsModel = allBreedsModelBackup;
      }
    });
  }
}

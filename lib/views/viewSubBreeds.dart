import 'package:assessment_zuhayrnoor/constants/constants.dart';
import 'package:assessment_zuhayrnoor/constants/extractedMethods.dart';
import 'package:assessment_zuhayrnoor/controller/getController.dart';
import 'package:assessment_zuhayrnoor/models/allBreeds.dart';
import 'package:assessment_zuhayrnoor/views/getImagesOfSubBreed.dart';
import 'package:assessment_zuhayrnoor/views/moreImagesOfABreed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewSubBreeds extends StatefulWidget {
  const ViewSubBreeds(
      {super.key, required this.namesOfSubbreeds, required this.nameOfBreed});
  final List namesOfSubbreeds;
  final String nameOfBreed;
  @override
  State<ViewSubBreeds> createState() => _ViewSubBreedsState();
}

class _ViewSubBreedsState extends State<ViewSubBreeds> {
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
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: brown,
                        size: 25,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Sub Breeds Of ${widget.nameOfBreed}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          color: brown,
                          fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              // buildSearchBar(searchSubBreedsController, updateSearchResult),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two items in each row
                    crossAxisSpacing:
                        Get.width * 0.04, // Space between items in the row
                    mainAxisSpacing: Get.height * 0.02,
                    mainAxisExtent: Get.height * 0.35 // Space between rows
                    ),
                itemCount: widget.namesOfSubbreeds.length,
                // allBreedsModel.message?.length ??
                //     0, // Total number of items
                itemBuilder: (BuildContext context, int index) {
                  print(allBreedsModel.message!.entries);

                  return Container(
                    decoration: boxDecorationForMainCardHomePage(),
                    // height: Get.height * 0.5, // Adjust the height as needed
                    width: Get.width * 0.35,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                    child: FutureBuilder<String>(
                      future: getQuery().randomImageByBreedAndSubBreedOfDog(
                          widget.nameOfBreed, widget.namesOfSubbreeds[index]),
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
                                  widget.namesOfSubbreeds[index],
                                  style: TextStyle(color: white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                customButtomContainerInsideMainCard(() {
                                  Get.to(GetImagesByBreedAndSubBreed(
                                    breedName: widget.nameOfBreed,
                                    subBreedName:
                                        widget.namesOfSubbreeds[index],
                                  ));
                                }, 'View More Images'),
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
      print('ss');
      if (searchText.trim() != '') {
        Map<String, dynamic> filteredEntries = Map.fromEntries(
          allBreedsModelBackup.message!.entries.where(
            (element) => element.key.contains(searchText.trim()),
          ),
        );
        allBreedsModel.message = filteredEntries;
      } else if (searchText == '' ||
          searchSubBreedsController.text.trim() == '') {
        allBreedsModel = allBreedsModelBackup;
      }
    });
  }
}

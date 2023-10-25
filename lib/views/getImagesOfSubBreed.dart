import 'package:assessment_zuhayrnoor/constants/constants.dart';
import 'package:assessment_zuhayrnoor/constants/extractedMethods.dart';
import 'package:assessment_zuhayrnoor/controller/getController.dart';
import 'package:assessment_zuhayrnoor/models/allBreeds.dart';
import 'package:assessment_zuhayrnoor/models/imageByBreed.dart';
import 'package:assessment_zuhayrnoor/models/listOfAllSubBreedImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetImagesByBreedAndSubBreed extends StatefulWidget {
  const GetImagesByBreedAndSubBreed(
      {super.key, required this.breedName, required this.subBreedName});
  final String breedName;
  final String subBreedName;
  @override
  State<GetImagesByBreedAndSubBreed> createState() =>
      _GetImagesByBreedAndSubBreedState();
}

class _GetImagesByBreedAndSubBreedState
    extends State<GetImagesByBreedAndSubBreed> {
  getImagesOfBreed() async {
    await getQuery()
        .listOfAllSubBreedImages(widget.breedName, widget.subBreedName);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImagesOfBreed();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        listOfAllSubBreedsImages = ListOfAllSubBreedsImages();
        return await Future.value(true);
      },
      child: Scaffold(
        backgroundColor: white,
        body: listOfAllSubBreedsImages.message == null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customCircularPogressIndicatorCentered(black),
                ],
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.06,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          widget.subBreedName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 26,
                              color: brown,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Two items in each row
                          crossAxisSpacing: Get.width *
                              0.02, // Space between items in the row
                          mainAxisSpacing: Get.height * 0.02,
                          // Space between rows
                        ),
                        itemCount: listOfAllSubBreedsImages.message!.length,
                        // allBreedsModel.message?.length ??
                        //     0, // Total number of items
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              showFullscreenImageDialog(context,
                                  listOfAllSubBreedsImages.message![index]);
                            },
                            child: Container(
                              decoration: boxDecorationForMainCardHomePage(),
                              // height:
                              //     Get.height * 0.5, // Adjust the height as needed
                              width: Get.width * 0.35,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 12),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Adjust the radius as needed
                                child: Image.network(
                                  listOfAllSubBreedsImages.message![index],
                                  // height: Get.height * 0.35,
                                  // width: Get.width * 0.35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

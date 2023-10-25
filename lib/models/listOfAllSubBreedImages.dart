class ListOfAllSubBreedsImages {
  List<String>? message;
  String? status;

  ListOfAllSubBreedsImages({this.message, this.status});

  ListOfAllSubBreedsImages.fromJson(Map<String, dynamic> json) {
    message = json['message'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

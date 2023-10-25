class RandomImageByBreed {
  String? message;
  String? status;

  RandomImageByBreed({this.message, this.status});

  RandomImageByBreed.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class AllBreeds {
  Map<String, dynamic>? message;
  String? status;

  AllBreeds({this.message, this.status});

  AllBreeds.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null ? json['message'] : null;
    status = json['status'];
  }
}

class ProfileInfo {
  String? firstName;
  String? lastName;
  String? email;
  bool? isConfirmed;
  String? gender;
  String? profilePicture;
  String? role;
  String? createdAt;
  String? updatedAt;
  String? status;

  ProfileInfo(
      {this.firstName,
      this.lastName,
      this.email,
      this.isConfirmed,
      this.gender,
      this.profilePicture,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.status});

  ProfileInfo.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    isConfirmed = json['isConfirmed'];
    gender = json['gender'];
    profilePicture = json['profilePicture'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
  }
}

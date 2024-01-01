class CreateUserModel {
  String? email;
  String? password;
  String? name;
  String? avatar;
  String? role;
  int? id;
  String? creationAt;
  String? updatedAt;

  CreateUserModel(
      {this.email,
        this.password,
        this.name,
        this.avatar,
        this.role,
        this.id,
        this.creationAt,
        this.updatedAt});

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    avatar = json['avatar'];
    role = json['role'];
    id = json['id'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['avatar'] = avatar;
    data['role'] = role;
    data['id'] = id;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

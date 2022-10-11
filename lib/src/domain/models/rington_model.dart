class RingtonModel {
  int? id;
  int? appId;
  String? name;
  String? pathRington;
  String? image;
  String? createdAt;
  String? updatedAt;

  RingtonModel({
    this.id,
    this.appId,
    this.name,
    this.pathRington,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  RingtonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appId = json['app_id'];
    name = json['name'];
    pathRington = json['path_rington'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // Map<String, dynamic> toMap() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['app_id'] = appId;
  //   data['name'] = name;
  //   data['path_rington'] = pathRington;
  //   data['image'] = image;
  //   data['created_at'] = createdAt;
  //   data['updated_at'] = updatedAt;
  //   return data;
  // }

  factory RingtonModel.fromMap(Map<String, dynamic> map) {
    return RingtonModel(
      id: map['id'],
      appId: map['app_id'],
      name: map['name'],
      pathRington: map['path_rington'],
      image: map['image'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }
}

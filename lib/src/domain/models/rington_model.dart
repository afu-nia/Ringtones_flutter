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

  // factory RingtonModel.empty() => RingtonModel(
  //       appId: null,
  //       createdAt: null,
  //       id: null,
  //       image: null,
  //       name: null,
  //       pathRington: null,
  //       updatedAt: null,
  //     );
}

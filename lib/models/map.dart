class Maps {
  final String? map_name;
  final String? map_description;
  final String? map_image;

  Maps({this.map_name, this.map_description, this.map_image});

  factory Maps.fromJson(dynamic json) {
    return Maps(
        map_name: json['map_name'] as String,
        map_description: json['map_description'] as String,
        map_image: json['map_featured_image_mobile']['url'] as String);
  }

  static List<Maps> mapsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Maps.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Map {map_name: $map_name, map_description: $map_description, map_image: $map_image}';
  }
}
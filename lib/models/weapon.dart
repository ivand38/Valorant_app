class Weapons {
  final String? displayName;
  final String? category;
  final String? displayIcon;
  final num? cost;
  final num? fireRate;
  final num? magazineSize;
  final num? reloadTimeSeconds;


  Weapons({this.displayName, this.category, this.displayIcon, this.cost, this.fireRate, this.magazineSize, this.reloadTimeSeconds});

  factory Weapons.fromJson(dynamic json) {
    return Weapons(
        displayName: json['displayName'] as String,
        category: json['shopData'] != null ? json['shopData']['category'] : 'No Data',
        displayIcon: json['displayIcon'] as String,
        cost: json['shopData'] != null ? json['shopData']['cost'] : 0,
        fireRate: json['weaponStats'] != null ? json['shopData']['fireRate'] : 0,
        magazineSize: json['weaponStats'] != null ? json['weaponStats']['magazineSize']: 0,
        reloadTimeSeconds:json['weaponStats'] != null ? json['weaponStats']['reloadTimeSeconds'] : 0,
        );
  }

  static List<Weapons> weaponsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Weapons.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Weapons {displayName: $displayName, category: $category, displayIcon: $displayIcon, cost: $cost, fireRate: $fireRate, magazineSize: $magazineSize, reloadTimeSeconds: $reloadTimeSeconds }';
  }
}
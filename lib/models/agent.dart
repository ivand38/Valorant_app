class Agent {
  final String? displayName;
  final String? description;
  final String? role;
  final String? display_icon;

  Agent({this.displayName, this.description, this.role, this.display_icon});

  factory Agent.fromJson(dynamic json) {
    return Agent(
        displayName: json['displayName'] as String,
        description: json['description'] as String,
        role: json['role']['displayName'] as String,
        display_icon: json['displayIcon'] as String);
  }

  static List<Agent> agentsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Agent.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Agent {displayName: $displayName, description: $description, role: $role, display_icon: $display_icon}';
  }
}
class Agent {
  final String? title;
  final String? description;
  final String? role;
  final String? agent_image;

  Agent({this.title, this.description, this.role, this.agent_image});

  factory Agent.fromJson(dynamic json) {
    return Agent(
        title: json['title'] as String,
        description: json['description'] as String,
        role: json['role'] as String,
        agent_image: json['agent_image']['url'] as String);
  }

  static List<Agent> agentsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Agent.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Agent {title: $title, description: $description, role: $role, agent_image: $agent_image}';
  }
}
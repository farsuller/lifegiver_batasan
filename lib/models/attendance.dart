class Attendance{

  String name;
  String leader;
  String lifegroup;
  String network;
  String platform;

  Attendance(this.name, this.leader, this.lifegroup, this.network, this.platform);

  factory Attendance.fromJson(dynamic json) {
    return Attendance(
        "${json['name']}",
        "${json['leader']}",
        "${json['lifegroup']}",
        "${json['network']}",
        "${json['platform']}"
    );
  }

  // Method to make GET parameters.
  Map toJson() => {
    'name': name,
    'leader': leader,
    'lifegroup': lifegroup,
    'network': network,
    'platform': platform
  };
}
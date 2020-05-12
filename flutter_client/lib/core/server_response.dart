class ServerResponse {
  final bool success;
  final int count;
  final List<dynamic> data;
  final Map<String, String> error;

  ServerResponse(this.success, {this.count, this.data, this.error});

  factory ServerResponse.fromJson(Map<String, dynamic> json) {
    return ServerResponse(
      json['success'],
      count: json['count'] ?? -1,
      data: json['data'] ?? [],
      error: json['error'] ?? {},
    );
  }

  @override
  String toString() {
    return 'success $success, count $count, data $data, error $error';
  }
}

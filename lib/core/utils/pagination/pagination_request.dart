class PaginationRequest {

  PaginationRequest({
    required this.page,
  });

  factory PaginationRequest.fromJson(Map<String, dynamic> json) =>
      PaginationRequest(
        page: json['page'],
      );
  final int page;

  Map<String, dynamic> toJson() => {
        'page': page,
      };
}

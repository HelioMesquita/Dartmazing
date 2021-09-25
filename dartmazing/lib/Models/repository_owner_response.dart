class RepositoryOwnerResponse {
  String login;
  String avatarUrl;

  RepositoryOwnerResponse({
    required this.login,
    required this.avatarUrl,
  });

  factory RepositoryOwnerResponse.fromJson(Map<String, dynamic> json) {
    return RepositoryOwnerResponse(
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }
}

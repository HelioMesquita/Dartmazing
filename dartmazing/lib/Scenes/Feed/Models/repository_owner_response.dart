class RepositoryOwnerResponse {
  String login;
  String avatarUrl;
  
  RepositoryOwnerResponse({
    this.login,
    this.avatarUrl,
  });

  RepositoryOwnerResponse.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
  }
  
}
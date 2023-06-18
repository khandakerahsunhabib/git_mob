class UserDetails {
  String? avatarUrl;
  String? name;
  String? bio;
  String? login;
  int? followers;
  int? following;
  int? publicRepos;

  UserDetails(
      {required this.avatarUrl,
      required this.name,
      required this.bio,
      required this.login,
      required this.followers,
      required this.following,
      required this.publicRepos});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
        avatarUrl: json['avatar_url'] as String,
        name: json['name'] as String,
        bio: json['bio'] as String,
        login: json['login'] as String,
        followers: json['followers'] as int,
        following: json['following'] as int,
        publicRepos: json['public_repos'] as int);
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar_url': avatarUrl,
      'name': name,
      'bio': bio,
      'login': login,
      'followers': followers,
      'following': following,
      'public_repos': publicRepos
    };
  }
}

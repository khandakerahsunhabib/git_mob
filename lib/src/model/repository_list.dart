class RepositoryList {
  String? reponame;
  String? createddate;
  String? lastpushed;
  String? branch;
  dynamic language;
  String? url;
  String? visibility;
  String? description;
  int? stars;

  RepositoryList({
    required this.reponame,
    required this.createddate,
    required this.lastpushed,
    required this.branch,
    required this.language,
    required this.url,
    required this.stars,
    required this.visibility,
    required this.description
  });

  factory RepositoryList.fromJson(Map<String, dynamic> json) {
    return RepositoryList(
        reponame: json['name'] as String,
        createddate: json['created_at'] as String,
        lastpushed: json['pushed_at'] as String,
        branch: json['default_branch'] as String,
        language: json['language'],
        url: json['html_url'] as String,
        stars: json['stargazers_count'] as int,
        visibility: json['visibility'] as String,
        description: json['description'] as String);
  }
}
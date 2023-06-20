class RepositoryList {
  String? reponame;
  String? createddate;
  String? lastpushed;
  String? branch;
  dynamic language;
  String? url;
  int? stars;

  RepositoryList({
    required this.reponame,
    required this.createddate,
    required this.lastpushed,
    required this.branch,
    required this.language,
    required this.url,
    required this.stars,
  });

  factory RepositoryList.fromJson(Map<String, dynamic> json) {
    return RepositoryList(
        reponame: json['name'] as String,
        createddate: json['created_at'] as String,
        lastpushed: json['pushed_at'] as String,
        branch: json['default_branch'] as String,
        language: json['language'],
        url: json['html_url'] as String,
        stars: json['stargazers_count'] as int);
  }
}

class All {
  List<RepositoryList> repos;

  All({required this.repos});

  factory All.fromJson(List<dynamic> json) {
    List<RepositoryList> repos = [];
    repos = json.map((e) => RepositoryList.fromJson(e)).toList();
    return All(repos: repos);
  }
}

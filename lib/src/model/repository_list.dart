class RepositoryList {
  String? repo_name;
  String? created_date;
  String? last_pushed;
  String? branch;
  dynamic? language;
  String? url;
  int? stars;

  RepositoryList({
    required this.repo_name,
    required this.created_date,
    required this.last_pushed,
    required this.branch,
    required this.language,
    required this.url,
    required this.stars,
  });

  factory RepositoryList.fromJson(Map<String, dynamic> json) {
    return RepositoryList(
        repo_name: json['name'] as String,
        created_date: json['created_at'] as String,
        last_pushed: json['pushed_at'] as String,
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

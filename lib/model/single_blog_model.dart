class SingleBlogModel {
  final String id;
  final String title;
  final String content;
  final String image;
  final String avatar;
  final String name;
  final List<String> categories;
  final List<String> tags;
  final String likeCount;
  final String commentCount;
  final String bio;

  SingleBlogModel({
    required this.id,
    required this.title,
    required this.image,
    required this.avatar,
    required this.name,
    required this.categories,
    required this.tags,
    required this.likeCount,
    required this.content,
    required this.commentCount,
    required this.bio,
  });

  factory SingleBlogModel.fromJson(Map<String, dynamic> json) {
    return SingleBlogModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      image: json['featured_image'] ?? '',
      name: json['author']?['name'] ?? '',
      avatar: json['author']?['avatar'] ?? '',
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          [],
      likeCount: json['like_count']?.toString() ?? '',
      content: json['content'] ?? '',
      commentCount: json['comment_count']?.toString()??'',
      bio: json['author']?['bio'] ?? ''
    );
  }
}

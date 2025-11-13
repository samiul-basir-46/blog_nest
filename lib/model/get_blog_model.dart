class GetBlogModel {
  final int id;
  final String title;
  final String excerpt;
  final String image;
  final List<String> categories;

  GetBlogModel({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.image,
    required this.categories,
  });

  factory GetBlogModel.fromJson(Map<String, dynamic> json){
    return GetBlogModel(id: json['id'],
        title: json['title'],
        excerpt: json['excerpt'],
        image: json['featured_image'],
        categories: List<String>.from(json['categories']));
  }

}

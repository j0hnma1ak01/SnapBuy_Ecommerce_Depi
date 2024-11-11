// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  final String url;
  final String name;
  final String slug;

  CategoryModel({
    required this.url,
    required this.name,
    required this.slug,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      url: json['url'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.url == url && other.name == name && other.slug == slug;
  }

  @override
  int get hashCode => url.hashCode ^ name.hashCode ^ slug.hashCode;
}

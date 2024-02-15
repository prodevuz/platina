class Post {
  int? id;
  Category? category;
  String? title;
  String? shortDescription;
  int? relatesTo;
  String? description;
  String? slug;
  bool? authorOffered;
  String? publish;
  bool? isPinned;
  int? numberOfViews;
  String? image;
  String? imageExtraLarge;
  String? imageLarge;
  String? imageMedium;
  String? imageSmall;
  String? imageSource;
  String? imageName;
  List<Gallery>? gallery;
  String? shortUrl;
  String? youtubeLink;
  List<String>? tags;
  String? expiredAt;
  String? language;

  Post(
      {this.id,
      this.category,
      this.title,
      this.shortDescription,
      this.relatesTo,
      this.description,
      this.slug,
      this.authorOffered,
      this.publish,
      this.isPinned,
      this.numberOfViews,
      this.image,
      this.imageExtraLarge,
      this.imageLarge,
      this.imageMedium,
      this.imageSmall,
      this.imageSource,
      this.imageName,
      this.gallery,
      this.shortUrl,
      this.youtubeLink,
      this.tags,
      this.expiredAt,
      this.language});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    title = json['title'];
    shortDescription = json['short_description'];
    relatesTo = json['relates_to'];
    description = json['description'];
    slug = json['slug'];
    authorOffered = json['author_offered'];
    publish = json['publish'];
    isPinned = json['is_pinned'];
    numberOfViews = json['number_of_views'];
    image = json['image'];
    imageExtraLarge = json['image_extra_large'];
    imageLarge = json['image_large'];
    imageMedium = json['image_medium'];
    imageSmall = json['image_small'];
    imageSource = json['image_source'];
    imageName = json['image_name'];
    if (json['gallery'] != null) {
      gallery = <Gallery>[];
      json['gallery'].forEach((v) {
        gallery!.add(Gallery.fromJson(v));
      });
    }
    shortUrl = json['short_url'];
    youtubeLink = json['youtube_link'];
    tags = json['tags'].cast<String>();
    expiredAt = json['expired_at'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['title'] = title;
    data['short_description'] = shortDescription;
    data['relates_to'] = relatesTo;
    data['description'] = description;
    data['slug'] = slug;
    data['author_offered'] = authorOffered;
    data['publish'] = publish;
    data['is_pinned'] = isPinned;
    data['number_of_views'] = numberOfViews;
    data['image'] = image;
    data['image_extra_large'] = imageExtraLarge;
    data['image_large'] = imageLarge;
    data['image_medium'] = imageMedium;
    data['image_small'] = imageSmall;
    data['image_source'] = imageSource;
    data['image_name'] = imageName;
    if (gallery != null) {
      data['gallery'] = gallery!.map((v) => v.toJson()).toList();
    }
    data['short_url'] = shortUrl;
    data['youtube_link'] = youtubeLink;
    data['tags'] = tags;
    data['expired_at'] = expiredAt;
    data['language'] = language;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? color;

  Category({this.id, this.name, this.slug, this.color});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['color'] = color;
    return data;
  }
}

class Gallery {
  String? image;

  Gallery({this.image});

  Gallery.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    return data;
  }
}
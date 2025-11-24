class ProductUserModel {
  final String id;
  final String username;
  final String name;
  final String firstName;
  final String lastName;
  final String? twitterUsername;
  final String? portfolioUrl;
  final String? bio;
  final String? location;
  final Map<String, dynamic>? links;
  final Map<String, dynamic>? profileImage;
  final String? instagramUsername;
  final int? totalCollections;
  final int? totalLikes;
  final int? totalPhotos;
  final int? totalPromotedPhotos;
  final int? totalIllustrations;
  final int? totalPromotedIllustrations;
  final bool? acceptedTos;
  final bool? forHire;
  final Map<String, dynamic>? social;

  ProductUserModel({
    required this.id,
    required this.username,
    required this.name,
    required this.firstName,
    required this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.totalPromotedPhotos,
    this.totalIllustrations,
    this.totalPromotedIllustrations,
    this.acceptedTos,
    this.forHire,
    this.social,
  });
  factory ProductUserModel.fromJson(Map<String, dynamic> json) {
    return ProductUserModel(
      id: json['id'] ?? "",
      username: json['username'] ?? "",
      name: json['name'] ?? "",
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      twitterUsername: json['twitter_username'],
      portfolioUrl: json['portfolio_url'],
      bio: json['bio'],
      location: json['location'],
      links: json['links'] != null
          ? Map<String, dynamic>.from(json['links'])
          : null,
      profileImage: json['profile_image'] != null
          ? Map<String, dynamic>.from(json['profile_image'])
          : null,
      instagramUsername: json['instagram_username'],
      totalCollections: json['total_collections'],
      totalLikes: json['total_likes'],
      totalPhotos: json['total_photos'],
      totalPromotedPhotos: json['total_promoted_photos'],
      totalIllustrations: json['total_illustrations'],
      totalPromotedIllustrations: json['total_promoted_illustrations'],
      acceptedTos: json['accepted_tos'],
      forHire: json['for_hire'],
      social: json['social'] != null
          ? Map<String, dynamic>.from(json['social'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'first_name': firstName,
      'last_name': lastName,
      'twitter_username': twitterUsername,
      'portfolio_url': portfolioUrl,
      'bio': bio,
      'location': location,
      'links': links,
      'profile_image': profileImage,
      'instagram_username': instagramUsername,
      'total_collections': totalCollections,
      'total_likes': totalLikes,
      'total_photos': totalPhotos,
      'total_promoted_photos': totalPromotedPhotos,
      'total_illustrations': totalIllustrations,
      'total_promoted_illustrations': totalPromotedIllustrations,
      'accepted_tos': acceptedTos,
      'for_hire': forHire,
      'social': social,
    };
  }
}

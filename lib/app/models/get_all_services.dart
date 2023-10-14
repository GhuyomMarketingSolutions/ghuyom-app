class GetAllServices {
  final bool? status;
  final bool? isSubscribed;
  final String? message;
  final int? result;
  final List<Services>? services;

  GetAllServices({
    this.status,
    this.isSubscribed,
    this.message,
    this.result,
    this.services,
  });

  GetAllServices.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        isSubscribed = json['isSubscribed'] as bool?,
        message = json['message'] as String?,
        result = json['result'] as int?,
        services = (json['services'] as List?)
            ?.map((dynamic e) => Services.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'isSubscribed': isSubscribed,
        'message': message,
        'result': result,
        'services': services?.map((e) => e.toJson()).toList()
      };
}

class Services {
  final String? id;
  final String? user;
  final String? business;
  final String? name;
  final String? description;
  final int? price;
  final String? image;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Services({
    this.id,
    this.user,
    this.business,
    this.name,
    this.description,
    this.price,
    this.image,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Services.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        user = json['user'] as String?,
        business = json['business'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        price = json['price'] as int?,
        image = json['image'] as String?,
        isDeleted = json['isDeleted'] as bool?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'user': user,
        'business': business,
        'name': name,
        'description': description,
        'price': price,
        'image': image,
        'isDeleted': isDeleted,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}

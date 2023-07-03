class GetAllBusinessesModel {
  final bool? status;
  final bool? isSubscribed;
  final String? message;
  final int? result;
  final List<Businesses>? businesses;

  GetAllBusinessesModel({
    this.status,
    this.isSubscribed,
    this.message,
    this.result,
    this.businesses,
  });

  GetAllBusinessesModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as bool?,
        isSubscribed = json['isSubscribed'] as bool?,
        message = json['message'] as String?,
        result = json['result'] as int?,
        businesses = (json['businesses'] as List?)
            ?.map((dynamic e) => Businesses.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'status': status,
        'isSubscribed': isSubscribed,
        'message': message,
        'result': result,
        'businesses': businesses?.map((e) => e.toJson()).toList()
      };
}

class Businesses {
  final Location? location;
  final WorkingHours? workingHours;
  final String? id;
  final String? user;
  final String? name;
  final String? category;
  final String? subCategory;
  final String? description;
  final String? address;
  final String? instagram;
  final String? website;
  final List<PhoneNumber>? phoneNumber;
  final List<String>? images;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Businesses({
    this.location,
    this.workingHours,
    this.id,
    this.user,
    this.name,
    this.category,
    this.subCategory,
    this.description,
    this.address,
    this.instagram,
    this.website,
    this.phoneNumber,
    this.images,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Businesses.fromJson(Map<String, dynamic> json)
      : location = (json['location'] as Map<String, dynamic>?) != null
            ? Location.fromJson(json['location'] as Map<String, dynamic>)
            : null,
        workingHours = (json['workingHours'] as Map<String, dynamic>?) != null
            ? WorkingHours.fromJson(
                json['workingHours'] as Map<String, dynamic>)
            : null,
        id = json['_id'] as String?,
        user = json['user'] as String?,
        name = json['name'] as String?,
        category = json['category'] as String?,
        subCategory = json['subCategory'] as String?,
        description = json['description'] as String?,
        address = json['address'] as String?,
        instagram = json['instagram'] as String?,
        website = json['website'] as String?,
        phoneNumber = (json['phoneNumber'] as List?)
            ?.map(
                (dynamic e) => PhoneNumber.fromJson(e as Map<String, dynamic>))
            .toList(),
        images =
            (json['images'] as List?)?.map((dynamic e) => e as String).toList(),
        isDeleted = json['isDeleted'] as bool?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'workingHours': workingHours?.toJson(),
        '_id': id,
        'user': user,
        'name': name,
        'category': category,
        'subCategory': subCategory,
        'description': description,
        'address': address,
        'instagram': instagram,
        'website': website,
        'phoneNumber': phoneNumber?.map((e) => e.toJson()).toList(),
        'images': images,
        'isDeleted': isDeleted,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v
      };
}

class Location {
  final List<double>? coordinates;
  final String? type;

  Location({
    this.coordinates,
    this.type,
  });

  Location.fromJson(Map<String, dynamic> json)
      : coordinates = (json['coordinates'] as List?)
            ?.map((dynamic e) => e as double)
            .toList(),
        type = json['type'] as String?;

  Map<String, dynamic> toJson() => {'coordinates': coordinates, 'type': type};
}

class WorkingHours {
  final Days? days;
  final String? startTime;
  final String? endTime;
  final bool? isOpen24Hours;
  final bool? isClosed;

  WorkingHours({
    this.days,
    this.startTime,
    this.endTime,
    this.isOpen24Hours,
    this.isClosed,
  });

  WorkingHours.fromJson(Map<String, dynamic> json)
      : days = (json['days'] as Map<String, dynamic>?) != null
            ? Days.fromJson(json['days'] as Map<String, dynamic>)
            : null,
        startTime = json['startTime'] as String?,
        endTime = json['endTime'] as String?,
        isOpen24Hours = json['isOpen24Hours'] as bool?,
        isClosed = json['isClosed'] as bool?;

  Map<String, dynamic> toJson() => {
        'days': days?.toJson(),
        'startTime': startTime,
        'endTime': endTime,
        'isOpen24Hours': isOpen24Hours,
        'isClosed': isClosed
      };
}

class Days {
  final bool? monday;
  final bool? tuesday;
  final bool? wednesday;
  final bool? thursday;
  final bool? friday;
  final bool? saturday;
  final bool? sunday;

  Days({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  Days.fromJson(Map<String, dynamic> json)
      : monday = json['monday'] as bool?,
        tuesday = json['tuesday'] as bool?,
        wednesday = json['wednesday'] as bool?,
        thursday = json['thursday'] as bool?,
        friday = json['friday'] as bool?,
        saturday = json['saturday'] as bool?,
        sunday = json['sunday'] as bool?;

  Map<String, dynamic> toJson() => {
        'monday': monday,
        'tuesday': tuesday,
        'wednesday': wednesday,
        'thursday': thursday,
        'friday': friday,
        'saturday': saturday,
        'sunday': sunday
      };
}

class PhoneNumber {
  final int? number;
  final bool? isWhatsappAvailable;
  final String? id;

  PhoneNumber({
    this.number,
    this.isWhatsappAvailable,
    this.id,
  });

  PhoneNumber.fromJson(Map<String, dynamic> json)
      : number = json['number'] as int?,
        isWhatsappAvailable = json['isWhatsappAvailable'] as bool?,
        id = json['_id'] as String?;

  Map<String, dynamic> toJson() =>
      {'number': number, 'isWhatsappAvailable': isWhatsappAvailable, '_id': id};
}

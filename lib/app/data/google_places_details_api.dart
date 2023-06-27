class GooglePlacesDetailsAPI {
  final List<dynamic>? htmlAttributions;
  final Result? result;
  final String? status;

  GooglePlacesDetailsAPI({
    this.htmlAttributions,
    this.result,
    this.status,
  });

  GooglePlacesDetailsAPI.fromJson(Map<String, dynamic> json)
      : htmlAttributions = json['html_attributions'] as List?,
        result = (json['result'] as Map<String, dynamic>?) != null
            ? Result.fromJson(json['result'] as Map<String, dynamic>)
            : null,
        status = json['status'] as String?;

  Map<String, dynamic> toJson() => {
        'html_attributions': htmlAttributions,
        'result': result?.toJson(),
        'status': status
      };
}

class Result {
  final List<AddressComponents>? addressComponents;
  final String? adrAddress;
  final String? formattedAddress;
  final Geometry? geometry;
  final String? icon;
  final String? iconBackgroundColor;
  final String? iconMaskBaseUri;
  final String? name;
  final List<Photos>? photos;
  final String? placeId;
  final String? reference;
  final List<String>? types;
  final String? url;
  final int? utcOffset;
  final String? vicinity;

  Result({
    this.addressComponents,
    this.adrAddress,
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.photos,
    this.placeId,
    this.reference,
    this.types,
    this.url,
    this.utcOffset,
    this.vicinity,
  });

  Result.fromJson(Map<String, dynamic> json)
      : addressComponents = (json['address_components'] as List?)
            ?.map((dynamic e) =>
                AddressComponents.fromJson(e as Map<String, dynamic>))
            .toList(),
        adrAddress = json['adr_address'] as String?,
        formattedAddress = json['formatted_address'] as String?,
        geometry = (json['geometry'] as Map<String, dynamic>?) != null
            ? Geometry.fromJson(json['geometry'] as Map<String, dynamic>)
            : null,
        icon = json['icon'] as String?,
        iconBackgroundColor = json['icon_background_color'] as String?,
        iconMaskBaseUri = json['icon_mask_base_uri'] as String?,
        name = json['name'] as String?,
        photos = (json['photos'] as List?)
            ?.map((dynamic e) => Photos.fromJson(e as Map<String, dynamic>))
            .toList(),
        placeId = json['place_id'] as String?,
        reference = json['reference'] as String?,
        types =
            (json['types'] as List?)?.map((dynamic e) => e as String).toList(),
        url = json['url'] as String?,
        utcOffset = json['utc_offset'] as int?,
        vicinity = json['vicinity'] as String?;

  Map<String, dynamic> toJson() => {
        'address_components':
            addressComponents?.map((e) => e.toJson()).toList(),
        'adr_address': adrAddress,
        'formatted_address': formattedAddress,
        'geometry': geometry?.toJson(),
        'icon': icon,
        'icon_background_color': iconBackgroundColor,
        'icon_mask_base_uri': iconMaskBaseUri,
        'name': name,
        'photos': photos?.map((e) => e.toJson()).toList(),
        'place_id': placeId,
        'reference': reference,
        'types': types,
        'url': url,
        'utc_offset': utcOffset,
        'vicinity': vicinity
      };
}

class AddressComponents {
  final String? longName;
  final String? shortName;
  final List<String>? types;

  AddressComponents({
    this.longName,
    this.shortName,
    this.types,
  });

  AddressComponents.fromJson(Map<String, dynamic> json)
      : longName = json['long_name'] as String?,
        shortName = json['short_name'] as String?,
        types =
            (json['types'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() =>
      {'long_name': longName, 'short_name': shortName, 'types': types};
}

class Geometry {
  final Location? location;
  final Viewport? viewport;

  Geometry({
    this.location,
    this.viewport,
  });

  Geometry.fromJson(Map<String, dynamic> json)
      : location = (json['location'] as Map<String, dynamic>?) != null
            ? Location.fromJson(json['location'] as Map<String, dynamic>)
            : null,
        viewport = (json['viewport'] as Map<String, dynamic>?) != null
            ? Viewport.fromJson(json['viewport'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'location': location?.toJson(), 'viewport': viewport?.toJson()};
}

class Location {
  final double? lat;
  final double? lng;

  Location({
    this.lat,
    this.lng,
  });

  Location.fromJson(Map<String, dynamic> json)
      : lat = json['lat'] as double?,
        lng = json['lng'] as double?;

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}

class Viewport {
  final Northeast? northeast;
  final Southwest? southwest;

  Viewport({
    this.northeast,
    this.southwest,
  });

  Viewport.fromJson(Map<String, dynamic> json)
      : northeast = (json['northeast'] as Map<String, dynamic>?) != null
            ? Northeast.fromJson(json['northeast'] as Map<String, dynamic>)
            : null,
        southwest = (json['southwest'] as Map<String, dynamic>?) != null
            ? Southwest.fromJson(json['southwest'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'northeast': northeast?.toJson(), 'southwest': southwest?.toJson()};
}

class Northeast {
  final double? lat;
  final double? lng;

  Northeast({
    this.lat,
    this.lng,
  });

  Northeast.fromJson(Map<String, dynamic> json)
      : lat = json['lat'] as double?,
        lng = json['lng'] as double?;

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}

class Southwest {
  final double? lat;
  final double? lng;

  Southwest({
    this.lat,
    this.lng,
  });

  Southwest.fromJson(Map<String, dynamic> json)
      : lat = json['lat'] as double?,
        lng = json['lng'] as double?;

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}

class Photos {
  final int? height;
  final List<String>? htmlAttributions;
  final String? photoReference;
  final int? width;

  Photos({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  Photos.fromJson(Map<String, dynamic> json)
      : height = json['height'] as int?,
        htmlAttributions = (json['html_attributions'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        photoReference = json['photo_reference'] as String?,
        width = json['width'] as int?;

  Map<String, dynamic> toJson() => {
        'height': height,
        'html_attributions': htmlAttributions,
        'photo_reference': photoReference,
        'width': width
      };
}

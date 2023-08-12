class FileUploadModel {
  final bool? status;
  final String? message;
  final Urls? urls;

  FileUploadModel({
    this.status,
    this.message,
    this.urls,
  });

  FileUploadModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as bool?,
      message = json['message'] as String?,
      urls = (json['urls'] as Map<String,dynamic>?) != null ? Urls.fromJson(json['urls'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'urls' : urls?.toJson()
  };
}

class Urls {
  final List<String>? images;
  final List<dynamic>? videos;
  final List<dynamic>? files;

  Urls({
    this.images,
    this.videos,
    this.files,
  });

  Urls.fromJson(Map<String, dynamic> json)
    : images = (json['images'] as List?)?.map((dynamic e) => e as String).toList(),
      videos = json['videos'] as List?,
      files = json['files'] as List?;

  Map<String, dynamic> toJson() => {
    'images' : images,
    'videos' : videos,
    'files' : files
  };
}
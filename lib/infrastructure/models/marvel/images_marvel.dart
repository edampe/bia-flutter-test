import 'package:bia_flutter_test/domain/entities/comic.dart';

class ImagesMarvel {
  final String path;
  final String extension;

  ImagesMarvel({
    required this.path,
    required this.extension,
  });

  factory ImagesMarvel.fromJson(Map<String, dynamic> json) => ImagesMarvel(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
      };

  Images toImages() => Images(path: path, extension: extension);
}

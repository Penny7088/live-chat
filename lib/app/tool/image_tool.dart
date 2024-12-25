import 'package:image_picker/image_picker.dart';

final ImagePicker _picker = ImagePicker();

Future<XFile?>  choosePhoto({int? imageQuality}) async {
  var pickImage = await _picker.pickImage(source: ImageSource.gallery, imageQuality: imageQuality);
  return pickImage;
}
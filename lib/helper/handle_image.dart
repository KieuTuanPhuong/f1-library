import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class HandleImage {
  //Choose a photo from the gallery
  Future<File> pickerImage(ImageSource source) async {
    try {
      final ImagePicker _picker = ImagePicker();
      final pickedFile = await _picker.pickImage(
        source: source,
      );
      return File(pickedFile!.path);
    } catch (e) {
      print(e);
    }
    return null!;
  }

//   //Create target path
//   String createTargetPath(File image) {
//     String _directory = path.dirname(image.path); // Get directory storage // import 'package:path/path.dart' as path;
//     String _baseName = path.basename(image.path);
//     String targetPath = _directory + '/new_' + _baseName;
//     return targetPath;
//   }
//
//   //Picker multi images
//   Future<List<Asset>> multiPickerImage(List<Asset> selectedAssetsPrevious) async {
//     List<Asset> resultListAsset = <Asset>[];
//     String error = 'No Error Dectected';
//     try {
//       resultListAsset = await MultiImagePicker.pickImages(
//         maxImages: 10,
//         enableCamera: true,
//         selectedAssets: selectedAssetsPrevious,
//         cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
//         materialOptions: MaterialOptions(
//           actionBarColor: "#abcdef",
//           actionBarTitle: "Example App",
//           allViewTitle: "All Photos",
//           useDetailsView: false,
//           selectCircleStrokeColor: "#000000",
//         ),
//       );
//     } on Exception catch (e) {
//       error = e.toString();
//     }
//     return resultListAsset;
//   }
//
//   //Convert from Asset Type to File Type
//   Future<List<File>> convertAssetToFile(List<Asset> listAssets) async {
//     List<File> _listFiles = <File>[];
//
//     for (int i = 0; i < listAssets.length; i++) {
//       var file = listAssets[i].getByteData(quality: 100).then((byteData) async {
//         final buffer = byteData.buffer;
//         return File((await getApplicationDocumentsDirectory()).path + '/' + listAssets[i].name.toString()).writeAsBytes(buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//         //Trả về File (param request: path + name file) (path+name_file)
//         //writeAsBytes để ghi file vào đường dẫn ở trên.
// //        _file.then((value) => _listFiles.add(value));
//       });
//       await file.then((value) {
//         _listFiles.add(value);
//       });
//     }
//     return _listFiles;
//   }
//
//   Future<List<String>> convertAssetToString(List<Asset> listAssets) async {
//     List<String> _listFiles = <String>[];
//
//     for (int i = 0; i < listAssets.length; i++) {
//       var file = listAssets[i].getByteData(quality: 100).then((byteData) async {
//         final buffer = byteData.buffer;
//         return File((await getApplicationDocumentsDirectory()).path + '/' + listAssets[i].name.toString()).writeAsBytes(buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//         //Trả về File (param request: path + name file) (path+name_file)
//         //writeAsBytes để ghi file vào đường dẫn ở trên.
// //        _file.then((value) => _listFiles.add(value));
//       });
//       await file.then((value) {
//         _listFiles.add(value.path);
//       });
//     }
//     return _listFiles;
//   }
}

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class PickFileViewModel extends GetxController with StateMixin<List<String>> {
  String nameFile = '';
  String pathFile = '';

  @override
  void onClose() {
    nameFile = '';
    pathFile = '';
    super.onClose();
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result != null) {
      final path = result.files.first.path;
      final name = result.files.first.name;
      pathFile = path!;
      nameFile = name;
      update(['image']);
    } else {
      // User canceled the picker
      return null;
    }
    update();
  }
}

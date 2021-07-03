import 'dart:io';

import 'package:path_provider/path_provider.dart';

class CartStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    // print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/cart.txt');
  }

  Future<String> readContent() async {
    try {
      final file = await _localFile;
      // Read the file
      String contents = await file.readAsString();
      // Returning the contents of the file
      return contents;
    } catch (e) {
      // If encountering an error, return
      return 'Error!';
    }
  }

  void writeContent(List<String> product) async {
    final file = await _localFile;
    file.writeAsStringSync('$product \n', mode: FileMode.append);
  }

  List<String> tmpList = [];
  int listLen = 0;

  void removeFromFile(int index) async {
    final file = await _localFile;
    readContent().then((String value) {
      tmpList = value.split('\n');
    });

    int tmp = 0;

    for (int i = 0; i < tmpList.length - 1; i++) {
      if (i != index) {
        // print('1------${tmpList[i]}------');
        tmp = i;
        file.writeAsStringSync('${tmpList[i]} \n', mode: FileMode.write);
        break;
      }
    }

    for (int j = 0; j < tmpList.length - 1; j++) {
      if (j != tmp && j != index) {
        // print('2------${tmpList[j]}------');
        file.writeAsStringSync('${tmpList[j]} \n', mode: FileMode.append);
      }
    }
  }
}

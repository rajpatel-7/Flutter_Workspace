import 'package:path/path.dart' as p;

void main() {
  String filePath = '/users/raj/documents/report.txt';

  String directory = p.dirname(filePath);
  String filename = p.basename(filePath);
  String extension = p.extension(filePath);

  print('Directory: $directory');
  print('File Name: $filename');
  print('Extension: $extension');
}

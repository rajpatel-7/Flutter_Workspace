import 'package:qr/qr.dart';

void main() {
  String data = "https://example.com";
  QrCode qr = QrCode(4, QrErrorCorrectLevel.L);
  qr.addData(data);
  qr.make();

  for (int x = 0; x < qr.moduleCount; x++) {
    String row = '';
    for (int y = 0; y < qr.moduleCount; y++) {
      row += qr.isDark(x, y) ? '██' : '  ';
    }
    print(row);
  }
}

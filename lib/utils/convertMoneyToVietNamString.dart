import 'dart:math';

void convertMoneyToVNString() {
  // Hàm chuyển đổi số sang chuỗi tiếng Việt
  String numberToVietnameseWord(int number) {
    List<String> ones = ['không', 'một', 'hai', 'ba', 'bốn', 'năm', 'sáu', 'bảy', 'tám', 'chín'];

    List<String> tens = ['', 'mười', 'hai mươi', 'ba mươi', 'bốn mươi', 'năm mươi', 'sáu mươi', 'bảy mươi', 'tám mươi', 'chín mươi'];

    List<String> groups = ['', 'nghìn', 'triệu', 'tỷ', 'nghìn tỷ', 'triệu tỷ', 'nghìn triệu tỷ', 'tỷ tỷ'];

    String result = '';
    int groupIndex = 0;

    do {
      // Lấy 3 số cuối của number
      int threeDigits = number % 1000;
      number ~/= 1000;

      // Xử lý ba số cuối và thêm vào kết quả
      if (threeDigits != 0) {
        String groupResult = '';
        int onesDigit = threeDigits % 10;
        int tensDigit = (threeDigits ~/ 10) % 10;
        int hundredsDigit = threeDigits ~/ 100;

        if (hundredsDigit != 0) {
          groupResult += ones[hundredsDigit] + ' trăm ';
        }

        if (tensDigit != 0) {
          if (tensDigit == 1) {
            groupResult += 'mười ';
          } else {
            groupResult += tens[tensDigit] + ' ';
          }
        }

        if (onesDigit != 0 && tensDigit != 1) {
          groupResult += ones[onesDigit] + ' ';
        }

        groupResult += groups[groupIndex];
        result = groupResult + ' ' + result;
      }

      groupIndex++;
    } while (number > 0);

    return result.trim();
  }

// Sử dụng hàm để chuyển đổi số sang cách đọc tiếng Việt
  int number = 99999123456789;
  String vietnameseWord = numberToVietnameseWord(number);
  print(vietnameseWord);
}

String numberToVietnameseWord(int number) {
  List<String> ones = ['không', 'một', 'hai', 'ba', 'bốn', 'năm', 'sáu', 'bảy', 'tám', 'chín'];

  List<String> tens = ['', 'mười', 'hai mươi', 'ba mươi', 'bốn mươi', 'năm mươi', 'sáu mươi', 'bảy mươi', 'tám mươi', 'chín mươi'];

  List<String> groups = ['', 'nghìn', 'triệu', 'tỷ', 'nghìn', 'triệu tỷ', 'nghìn triệu tỷ', 'tỷ tỷ'];

  String result = '';
  int groupIndex = 0;

  do {
    // Lấy 3 số cuối của number
    int threeDigits = number % 1000;
    number ~/= 1000;

    // Xử lý ba số cuối và thêm vào kết quả
    if (threeDigits != 0) {
      String groupResult = '';
      int onesDigit = threeDigits % 10;
      int tensDigit = (threeDigits ~/ 10) % 10;
      int hundredsDigit = threeDigits ~/ 100;

      if (hundredsDigit != 0) {
        groupResult += ones[hundredsDigit] + ' trăm ';
      }

      if (tensDigit != 0) {
        if (tensDigit == 1) {
          groupResult += 'mười ';
        } else {
          groupResult += tens[tensDigit] + ' ';
        }
      }

      if (onesDigit != 0 && tensDigit != 1) {
        groupResult += ones[onesDigit] + ' ';
      }

      groupResult += groups[groupIndex];
      result = groupResult + ' ' + result;
    }

    groupIndex++;
  } while (number > 0);

  return result.trim();
}

const List<String> ZERO_LEFT_PADDING = ["", "00", "0"];

const List<String> DIGITS = ["không", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín"];

const List<String> MULTIPLE_THOUSAND = ["", "nghìn", "triệu", "tỷ", "nghìn tỷ", "triệu tỷ", "tỷ tỷ"];

bool shouldShowZeroHundred(List<String> goups) {
  List<String> reversedGroups = [...goups].reversed.toList();
  int count = reversedGroups.takeWhile((it) => it == "000").length;
  return count < reversedGroups.length - 1;
}

String readTriple(String triple, bool showZeroHundred) {
  List<int> digits = triple.split('').map(int.parse).toList();

  int a = digits[0];
  int b = digits[1];
  int c = digits[2];

  if (a == 0 && b == 0 && c == 0) {
    return "";
  } else if (a == 0 && showZeroHundred) {
    return "không trăm ${readPair(b, c)}";
  } else if (a == 0 && b == 0) {
    return DIGITS[c];
  } else if (a == 0) {
    return readPair(b, c);
  } else {
    return "${DIGITS[a]} trăm ${readPair(b, c)}";
  }
}

String readPair(int b, int c) {
  switch (b) {
    case 0:
      return c == 0 ? '' : 'linh ${DIGITS[c]}';
    case 1:
      switch (c) {
        case 0:
          return 'mười';
        case 5:
          return 'mười lăm';
        default:
          return 'mười ${DIGITS[c]}';
      }
    default:
      switch (c) {
        case 0:
          return '${DIGITS[b]} mươi ';
        case 1:
          return '${DIGITS[b]} mươi mốt';
        case 4:
          return '${DIGITS[b]} mươi tư';
        case 5:
          return '${DIGITS[b]} mươi lăm';
        default:
          return '${DIGITS[b]} mươi ${DIGITS[c]}';
      }
  }
}

extension StringExtensions on String {
  Iterable<String> chunk(int chunkSize) sync* {
    for (int i = 0; i < length; i += chunkSize) {
      yield substring(i, min(i + chunkSize, length));
    }
  }

  String capitalize() {
    if (isEmpty) {
      throw 'Input cannot be empty';
    } else {
      return substring(0, 1).toUpperCase() + substring(1).toLowerCase();
    }
  }
}

extension IntegerExtensions on int {
  String toVietnameseWords() {
    if (this == 0) {
      return 'Không';
    }

    if (this < 0) {
      return 'Âm ${(-this).toVietnameseWords().toLowerCase()}';
    }

    String s = toString();

    List<String> groups = (ZERO_LEFT_PADDING[s.length % 3] + s).chunk(3).toList();
    bool showZeroHundred = shouldShowZeroHundred(groups);

    int index = -1;
    String rawResult = groups.fold('', (String acc, String e) {
      index++;
      String triple = readTriple(e, showZeroHundred && index > 0);
      String multipleThousand = triple.trim().isEmpty ? '' : MULTIPLE_THOUSAND[groups.length - 1 - index];
      return '$acc $triple $multipleThousand';
    });

    return RegExp(r'\s+').allMatches(rawResult).isEmpty ? rawResult.trim().capitalize() : rawResult.replaceAll(RegExp(r'\s+'), ' ').trim().capitalize();
  }
}

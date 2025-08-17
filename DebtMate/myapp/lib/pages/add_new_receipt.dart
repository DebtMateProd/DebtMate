import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:myapp/pages/assign_receipt_page.dart';
import 'package:myapp/utils/route_helper.dart';
import 'package:myapp/utils/toast.dart';
import 'package:myapp/widgets/button.dart';
import 'package:myapp/widgets/text_field.dart';

class AddReceiptPage extends StatefulWidget {
  const AddReceiptPage({super.key});

  @override
  State<AddReceiptPage> createState() => _AddReceiptPageState();
}

class _AddReceiptPageState extends State<AddReceiptPage> {

  final ImagePicker _picker = ImagePicker();
  final TextEditingController _receiptController = TextEditingController();
  final TextEditingController _numbersController = TextEditingController();

  final textRecognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );
  FocusNode _focus = FocusNode();

  final RegExp _priceLineRegex = RegExp(r'^\d+,\d{2}$');         
  final RegExp _nameLineRegex  = RegExp(r'^(?=.*\S).+$'); 

  bool hideFullInfo = false;


  @override
  void initState() {
    super.initState();
    _updateLineNumbers(); // initial

    _focus.addListener(_onFocusChange);
  }

   @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {
      hideFullInfo = true;
    });
  }

  void _updateLineNumbers() {
    final linesCount = _receiptController.text.split('\n').length;
    setState(() {
      _numbersController.text = List.generate(linesCount, (index) => (index + 1).toString()).join('\n');
    });
  }

  Future<void> _scanReceipt() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile == null) return;

    final inputImage = InputImage.fromFile(File(pickedFile.path));
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    List<_OcrLine> linesData = [];

    for (final block in recognizedText.blocks) {
      for (final line in block.lines) {
        linesData.add(
          _OcrLine(
            text: line.text,
            left: line.boundingBox.left,
            top: line.boundingBox.top,
          ),
        );
      }
    }

    // Sortujemy po top (od góry do dołu)
    linesData.sort((a, b) => a.top.compareTo(b.top));

    const rowTolerance = 30; // tolerancja w px dla jednej linii paragonu
    List<List<_OcrLine>> groupedRows = [];
    List<_OcrLine> currentRow = [];

    for (var line in linesData) {
      if (currentRow.isEmpty) {
        currentRow.add(line);
      } else {
        if ((line.top - currentRow.last.top).abs() < rowTolerance) {
          currentRow.add(line);
        } else {
          groupedRows.add(currentRow);
          currentRow = [line];
        }
      }
    }
    if (currentRow.isNotEmpty) groupedRows.add(currentRow);

    StringBuffer receiptText = StringBuffer();
    for (var row in groupedRows) {
      receiptText.writeln(row.reversed.map((e) => e.text).join(' '));
    }

    _receiptController.text = receiptText.toString();

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rozliczanie paragonu", style: TextStyle(color: Colors.white),), backgroundColor: Colors.cyan,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomButton(
                        labelText: "Zrób zdjęcie paragonu", 
                        onPressed: () async {
                          await _scanReceipt();
                          _updateLineNumbers();
                        },
                      ),
                      hideFullInfo ? Text("  Mleko 1L\n"
                        "  7,79\n"
                        "  Chleb\n"
                        "  3,49\n",
                        style: TextStyle(fontSize: 14, color: Colors.white)) : 
                        Text(
                        "Jak wprowadzać dane?\n"
                        "1. Zrób zdjęcie paragonu\n"
                        "2. Edytuj zawartość paragonu w polu poniżej w następujący sposób:\n"
                        " - Każdy produkt w nowej linii\n"
                        " - Po nazwie produktu wstaw cenę w kolejnej linii\n"
                        " - Przykład:\n"
                        "  Mleko 1L\n"
                        "  7,79\n"
                        "  Chleb\n"
                        "  3,49\n"
                        "3. Po zakończeniu edycji kliknij 'Przejdź dalej'\n",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: 
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InputTextField(
                                controller: _numbersController,
                                maxLines: null,
                                readOnly: true,
                                inputType: TextInputType.multiline,
                              ),
                            )
                          ),
                          Expanded(
                            flex: 5,
                            child: 
                            InputTextField(
                              controller: _receiptController,
                              maxLines: null,
                              focusNode: _focus,
                              inputType: TextInputType.multiline,
                              labelText: "Wprowadź dane paragonu",
                              onChanged: (value) => _updateLineNumbers(),
                            )
                          ),
                        ],
                      ),
                      CustomButton(
                        labelText: "Przejdź dalej", 
                        onPressed: (){
                          if (_checkFormatAndToast()) {
                            final products = parseProducts(_receiptController.text);
                
                            RouteHelper.getToWithArgs('/assignReceipt', products);
                          }
                        } 
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _checkFormatAndToast() {
    final rawLines = _receiptController.text.split(RegExp(r'\r?\n'));
    final indexedTrimmed = List.generate(
      rawLines.length,
      (i) => MapEntry(i, rawLines[i].trim()),
    );

    final lines = indexedTrimmed.where((e) => e.value.isNotEmpty).toList();

    String? errorMsg;

    if (lines.isEmpty) {
      errorMsg = 'Brak treści do sprawdzenia.';
    } else if (lines.length.isOdd) {
      errorMsg = 'Nieparzysta liczba niepustych linii (brakuje ceny lub nazwy).';
    } else {
      for (int i = 0; i < lines.length; i += 2) {
        final nameEntry  = lines[i];
        final priceEntry = lines[i + 1];

        final nameOk  = _nameLineRegex.hasMatch(nameEntry.value);
        final priceOk = _priceLineRegex.hasMatch(priceEntry.value);

        if (!nameOk) {
          errorMsg =
              'Błąd w linii ${nameEntry.key + 1}: oczekiwana nazwa produktu.';
          break;
        }
        if (!priceOk) {
          errorMsg =
              'Błąd w linii ${priceEntry.key + 1}: oczekiwana cena w formacie X,YY (np. 7,79).';
          break;
        }
      }
    }

    final ok = errorMsg == null;

    showToast(ok ? 'Format poprawny ✅' : 'Format niepoprawny ❌\n$errorMsg');

    return ok;
  }


  List<Product> parseProducts(String input) {
    try {
      final lines = input.split('\n').map((line) => line.trim()).toList();
      final products = <Product>[];

      for (int i = 0; i < lines.length; i += 2) {
        if (i + 1 < lines.length) {
          final name = lines[i];
          final priceStr = lines[i + 1].replaceAll(',', '.'); 
          final price = double.tryParse(priceStr);

          if (price == null) {
            throw FormatException('Niepoprawna cena: ${lines[i + 1]}');
          }

          products.add(Product(name: name, price: price));
        } else {
          throw FormatException('Nieparzysta liczba linii w tekście');
        }
      }

      return products;
    } catch (e) {
      showToast('Błąd podczas parsowania produktów');
      return [];
    }
  }
}



class _OcrLine {
  final String text;
  final double left;
  final double top;

  _OcrLine({required this.text, required this.left, required this.top});
}

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/controllers/receipt_controller.dart';
import 'package:myapp/models/requests/analyze_receipt_request.dart';
import 'package:myapp/pages/assign_receipt_page.dart';
import 'package:myapp/repositories/receipt_repository.dart';
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
  final ReceiptController receiptController = ReceiptController(ReceiptRepository());
  
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _receiptController = TextEditingController();
  final TextEditingController _numbersController = TextEditingController();

  final FocusNode _focus = FocusNode();

  final RegExp _priceLineRegex = RegExp(r'^\d+[.,]\d{2}$');         
  final RegExp _nameLineRegex  = RegExp(r'^(?=.*\S).+$');

  bool hideFullInfo = false;
  bool _isScanning = false;


  @override
  void initState() {
    super.initState();
    _updateLineNumbers();

    _focus.addListener(_onFocusChange);
  }

   @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    _receiptController.dispose();
    _numbersController.dispose();
    
    super.dispose();
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

  Future<ImageSource?> makeUserChooseSourceOfImage() async{
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.cyan,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("Dodaj paragon", style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo, color: Colors.white),
                title: const Text("Wybierz z galerii", style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.white),
                title: const Text("Zrób zdjęcie", style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
            ],
          ),
        );
      },
    );

    return source;
  }

  Future<void> _scanReceipt() async {
    final source = await makeUserChooseSourceOfImage();
    if (source == null) return;

    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile == null) return;

    setState(() {
      _isScanning = true;
      // Czyścimy pole przed nowym skanem
      _receiptController.clear(); 
      _numbersController.clear();
    });

    try {
      AnalyzeReceiptRequest request = AnalyzeReceiptRequest(file: XFile(pickedFile.path));

      final response = await receiptController.analyzeReceipt(request);

      if (response.success && response.items.isNotEmpty) {
        StringBuffer receiptBuffer = StringBuffer();

        for (var item in response.items) {
          receiptBuffer.writeln(item.item);
          receiptBuffer.writeln(item.price.toStringAsFixed(2));
        }

        String finalText = receiptBuffer.toString().trim();
        _receiptController.text = finalText;
        
        showToast('Paragon przetworzony pomyślnie!');
      } else {
        showToast('Nie udało się odczytać paragonu: ${response.message}');
      }
    } catch (e) {
      showToast('Wystąpił błąd podczas przetwarzania: $e');
    } finally {
      setState(() {
        _isScanning = false;
        _updateLineNumbers();
      });
    }
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rozliczanie paragonu", style: TextStyle(color: Colors.white),), backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      _isScanning 
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  CircularProgressIndicator(color: Colors.white),
                                  SizedBox(height: 10),
                                  Text("Przetwarzanie paragonu przez AI...", style: TextStyle(color: Colors.white))
                                ],
                              ),
                            )
                          )
                        : CustomButton(
                            labelText: "Zrób zdjęcie / Wybierz plik", // Lekka zmiana tekstu, żeby pasował do PC
                            onPressed: () async {
                              await _scanReceipt();
                            },
                          ),
                          
                      const SizedBox(height: 10),
                      
                      // ZMIANA 2: Usunięto rozróżnienie tekstu dla Weba.
                      // Teraz instrukcja jest jedna dla wszystkich.
                      hideFullInfo 
                        ? const Text(
                            "  Mleko 1L\n"
                            "  7.79\n"
                            "  Chleb\n"
                            "  3.49\n",
                            style: TextStyle(fontSize: 14, color: Colors.white)
                          ) 
                        : const Text(
                              "Jak wprowadzać dane?\n"
                              "1. Zrób zdjęcie paragonu lub wybierz plik z galerii\n"
                              "2. Edytuj zawartość paragonu w polu poniżej w następujący sposób:\n"
                              " - Każdy produkt w nowej linii\n"
                              " - Po nazwie produktu wstaw cenę w kolejnej linii\n"
                              " - Przykład:\n"
                              "  Mleko 1L\n"
                              "  7.79\n"
                              "  Chleb\n"
                              "  3.49\n"
                              "3. Po zakończeniu edycji kliknij 'Przejdź dalej'\n",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      const SizedBox(height: 10),
                      CustomButton(
                        labelText: "Przejdź dalej", 
                        onPressed: (){
                          if (_checkFormatAndToast()) {
                            final products = parseProducts(_receiptController.text);
                            RouteHelper.getToWithArgs(context, '/assignReceipt', products);
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
    // Usuwamy puste linie, ale zachowujemy informację o oryginalnym indeksie dla użytkownika
    var lines = <MapEntry<int, String>>[];
    for(int i=0; i<rawLines.length; i++) {
      if(rawLines[i].trim().isNotEmpty) {
        lines.add(MapEntry(i, rawLines[i].trim()));
      }
    }

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
              'Błąd w linii ${priceEntry.key + 1}: oczekiwana cena (np. 7.79 lub 7,79).';
          break;
        }
      }
    }

    final ok = errorMsg == null;

    if (!ok) {
      showToast('Format niepoprawny ❌\n$errorMsg');
    } 
    // Opcjonalnie: nie pokazujemy toasta "Poprawny", po prostu przechodzimy dalej, 
    // ale jeśli chcesz potwierdzenie, odkomentuj poniższą linię:
    // else showToast('Format poprawny ✅');

    return ok;
  }

  List<Product> parseProducts(String input) {
    try {
      // Pobieramy tylko niepuste linie
      final lines = input.split('\n')
          .map((line) => line.trim())
          .where((line) => line.isNotEmpty)
          .toList();
          
      final products = <Product>[];

      for (int i = 0; i < lines.length; i += 2) {
        if (i + 1 < lines.length) {
          final name = lines[i];
          // Zamieniamy przecinek na kropkę, żeby double.parse zadziałał
          final priceStr = lines[i + 1].replaceAll(',', '.'); 
          final price = double.tryParse(priceStr);

          if (price == null) {
            throw FormatException('Niepoprawna cena: ${lines[i + 1]}');
          }

          products.add(Product(name: name, price: price));
        }
      }

      return products;
    } catch (e) {
      showToast('Błąd podczas parsowania produktów: $e');
      return [];
    }
  }
}

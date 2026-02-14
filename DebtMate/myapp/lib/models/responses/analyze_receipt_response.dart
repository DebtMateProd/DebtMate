class AnalyzeReceiptResp {
  final bool success;
  final String message;
  final List<ReceiptItemResp> items;

  AnalyzeReceiptResp({
    required this.success,
    required this.message,
    required this.items,
  });
}

class ReceiptItemResp {
  final String item;
  final double price;

  ReceiptItemResp({
    required this.item,
    required this.price,
  });
}
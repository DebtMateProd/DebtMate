import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final String hint;
  final ValueChanged<T?> onChanged;
  final Widget Function(T) itemBuilder;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.hint,
    required this.onChanged,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<T>(
      isExpanded: true,
      value: value,
      underline: SizedBox.shrink(),
      hint: Row(
        children: [
          const Icon(Icons.person, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            hint,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
      items: items
          .map((item) => DropdownMenuItem<T>(
                value: item,
                child: itemBuilder(item),
              ))
          .toList(),
      onChanged: onChanged,
      buttonStyleData: ButtonStyleData(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.cyan.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200,
        decoration: BoxDecoration(
          color: Colors.cyan.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 2,
        offset: const Offset(0, -4),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(Icons.arrow_drop_down, color: Colors.cyan),
        iconSize: 28,
      ),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }
}
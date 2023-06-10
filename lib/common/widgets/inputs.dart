import 'package:starter_kit_flutter/common/utils/extensions.dart';
import 'package:starter_kit_flutter/common/utils/funtion_utils.dart';
import 'package:flutter/material.dart';

class AtristaDownItemInput extends StatelessWidget {
  final List<String> items;
  final String? labelText;
  final String? selected;
  final String? initialItemLabelText;
  final bool? isInitialItemLabel;
  final String? labelPrefix;
  final String? labelSuffix;
  final Function(String value)? onChanged;

  const AtristaDownItemInput({
    super.key,
    required this.items,
    required this.labelText,
    this.onChanged,
    this.initialItemLabelText,
    this.isInitialItemLabel = true,
    this.selected,
    this.labelPrefix,
    this.labelSuffix,
  });

  List<DropdownMenuItem<String>> _listBuilder(List<String> items, BuildContext context) {
    final List<DropdownMenuItem<String>> newItems = [];
    if (isInitialItemLabel == true) {
      newItems.add(
        DropdownMenuItem(
          value: 'Select A $labelText',
          child: Text(
            initialItemLabelText != null ? initialItemLabelText! : toSentenceCase('Select A $labelText'),
            style: const TextStyle(color: Colors.black38, fontSize: 14),
          ),
        ),
      );
    }
    for (final element in items) {
      final label = "${labelPrefix != null ? '$labelPrefix ' : ''}${toSentenceCase(element)}${labelSuffix != null ? ' $labelSuffix' : ''}";
      newItems.add(
        DropdownMenuItem(
          value: element,
          child: Text(
            label,
            style: context.textTheme.bodyLarge,
          ),
        ),
      );
    }
    return newItems;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      hint: Text(labelText!),
      isExpanded: true,
      value: selected ?? 'Select A $labelText',
      elevation: 16,
      onChanged: (String? value) {
        if (value != 'Select A $labelText' && value != null && onChanged != null) {
          onChanged!(value);
        }
      },
      items: _listBuilder(items, context),
    );
  }
}

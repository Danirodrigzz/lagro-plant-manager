import 'package:flutter/material.dart';
import 'package:lagro_plant_manager/core/theme/app_colors.dart';
import 'package:lagro_plant_manager/core/utils/debouncer.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String) onSearch;
  final String? initialValue;

  const SearchBarWidget({
    super.key,
    required this.onSearch,
    this.initialValue,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController _controller;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            if (!isDark)
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: TextField(
          controller: _controller,
          onChanged: (value) {
            _debouncer.run(() => widget.onSearch(value));
            setState(() {});
          },
          decoration: InputDecoration(
            hintText: 'Buscar plantas...',
            hintStyle: TextStyle(
              color: isDark ? AppColors.darkTextSecondary : Colors.grey[400],
              fontSize: 15,
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: isDark ? AppColors.darkTextSecondary : Colors.grey[500],
            ),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      color: isDark ? AppColors.darkTextSecondary : Colors.grey[600],
                      size: 20,
                    ),
                    onPressed: () {
                      _controller.clear();
                      widget.onSearch('');
                      setState(() {});
                    },
                  )
                : null,
            filled: true,
            fillColor: isDark ? AppColors.darkCard : Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: isDark 
                ? const BorderSide(color: AppColors.darkBorder, width: 1)
                : BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: isDark 
                ? const BorderSide(color: AppColors.darkBorder, width: 1)
                : BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: AppColors.primary.withOpacity(0.5),
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
          ),
        ),
      ),
    );
  }
}

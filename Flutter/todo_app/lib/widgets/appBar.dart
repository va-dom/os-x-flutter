import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String titleText;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final TextEditingController searchController;
  final Function(String)? onSearch;
  final VoidCallback? onClearSearch;
  final VoidCallback? onOpenFilter;

  const MyAppBar(
      {super.key,
      required this.titleText,
      this.showBackButton = false,
      this.onBackPressed,
      required this.searchController,
      this.onSearch,
      this.onClearSearch,
      this.onOpenFilter});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


class _MyAppBarState extends State<MyAppBar> {
  bool _showSearchField = false;

  void _toggleSearchField() {
    setState(() {
      _showSearchField = !_showSearchField;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _showSearchField
          ? _buildSearchField()
          : Text(
              widget.titleText,
              style: const TextStyle(
                  color: myOrangeAccent, fontWeight: FontWeight.bold),
            ),
      leading: _showSearchField
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              color: myOrangeAccent,
              onPressed: _toggleSearchField,
            )
          : widget.onBackPressed != null
              ? IconButton(
                  onPressed: widget.onBackPressed,
                  icon: const Icon(Icons.arrow_back),
                  color: myOrangeAccent,
                )
              : null,
      backgroundColor: myOrange,
      actions: <Widget>[
        Row(
          children: [
            IconButton(
              icon: Icon(_showSearchField ? Icons.close : Icons.search),
              color: myOrangeAccent,
              onPressed:
                  _showSearchField ? widget.onClearSearch : _toggleSearchField,
            ),
            if (widget.showBackButton) const SizedBox(width: 1),
            if (widget.showBackButton)
              IconButton(
                icon: const Icon(Icons.filter_list),
                color: myOrangeAccent,
                onPressed: widget.onOpenFilter,
              )

          ],
        )
      ],
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: widget.searchController,
      onChanged: widget.onSearch,
      style: const TextStyle(color: myOrangeAccent, fontSize: 20),
      decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          hintStyle: TextStyle(color: myOrangeAccent, fontSize: 20)),
    );
  }
}

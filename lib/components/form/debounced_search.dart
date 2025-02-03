import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DebouncedSearch extends ConsumerStatefulWidget {
  const DebouncedSearch({
    super.key,
    required this.onDebounceChange,
  });

  final void Function(String) onDebounceChange;

  @override
  ConsumerState<DebouncedSearch> createState() => _DebouncedSearchState();
}

class _DebouncedSearchState extends ConsumerState<DebouncedSearch> {
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Durations.long1, () {
      widget.onDebounceChange(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16) +
          const EdgeInsets.only(bottom: 8),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onChanged: _onSearchChanged,
      ),
    );
  }
}

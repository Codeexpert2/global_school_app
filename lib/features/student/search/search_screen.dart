import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  // function to be called when the search
  // button is pressed
  void onSearch() {
    // Add your search logic here
    // Example:
    // setState(() {
    //   _searchResults = fetchSearchResults(_searchText);
    // });

    // Example:
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => SearchResultsScreen()),
    // );
    // });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: Text('Search Page')),
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with your dynamic item count
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.search),
                    title: Text('Search Result $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

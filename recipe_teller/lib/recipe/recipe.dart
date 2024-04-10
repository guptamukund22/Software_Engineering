import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final List<String> _ingredients = [];
  final TextEditingController _controller = TextEditingController();

  void _addIngredient(String ingredient) {
    if (ingredient.isNotEmpty) {
      setState(() {
        _ingredients.add(ingredient);
        _controller.clear();
      });
    }
  }

  void _removeIngredient(String ingredient) {
    setState(() {
      _ingredients.remove(ingredient);
    });
  }

  void _findDish() {
    // Implement your dish search logic here
    print("Searching for dishes with: ${_ingredients.join(", ")}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
                onSubmitted: _addIngredient,
                decoration: InputDecoration(
                  labelText: "Enter Ingredients",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () => _addIngredient(_controller.text),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Wrap(
              spacing: 8.0,
              children: _ingredients
                  .map((ingredient) => Chip(
                        label: Text(ingredient,
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.blue,
                        deleteIcon: Icon(Icons.close, size: 18),
                        onDeleted: () => _removeIngredient(ingredient),
                      ))
                  .toList(),
            ),
            ElevatedButton(
              onPressed: _findDish,
              child: Text("Find"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            // Placeholder for search results
            // Replace this with your actual data display widget
            Container(
              height: 300, // Adjust based on your content
              child: ListView.builder(
                itemCount: 10, // Replace with your dynamic count
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      title: Text("Dish $index",
                          style: TextStyle(color: Colors.black)),
                      subtitle: Text("Description of Dish $index"),
                      // Add more details according to your data
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

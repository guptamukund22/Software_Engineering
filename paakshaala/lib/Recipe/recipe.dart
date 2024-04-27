import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:paakshaala/Recipe/recipe_api.dart';
import 'package:paakshaala/constants/fonts.dart';
import 'package:paakshaala/fridge/chef_desk.dart';
import 'package:url_launcher/url_launcher.dart';

List<Recipe> recipes_ = [];
Map<String, String> veg = {
  "V": "assets/images/veg.png",
  "NV": "assets/images/non-veg.png",
  "J": "assets/images/jain.png",
  "EV": "assets/images/egg.png",
  "DF": "assets/images/df.png",
  "GF": "assets/images/gf.png"
};

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  int ingred = 0;
  final TextEditingController _controller = TextEditingController();

  void _addIngredient(String ingredient) {
    if (ingredient.isNotEmpty) {
      setState(() {
        mychefDesk.add(ingredient);
        _controller.clear();
        ingred = 1;
      });
    }
  }

  void _removeIngredient(String ingredient) {
    setState(() {
      mychefDesk.remove(ingredient);
    });
  }

  void _findDish() async {
    String ingredients = '';
    for (int i = 0; i < mychefDesk.length; i++) {
      ingredients += mychefDesk[i];
      if (i != mychefDesk.length - 1) {
        ingredients += ',';
      }
    }
    recipes_ = await getRecipe(ingredients);
    setState(() {
      print(recipes_.length);
    });
  }

  void initState() {
    super.initState();
    if (mychefDesk.length > 0) {
      ingred = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
                onSubmitted: _addIngredient,
                decoration: InputDecoration(
                  labelText: "Enter Ingredients",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () => _addIngredient(_controller.text),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Wrap(
              spacing: 8.0,
              children: mychefDesk
                  .map((ingredient) => Chip(
                        label: Text(ingredient,
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.blue,
                        deleteIcon: Icon(Icons.close, size: 18),
                        onDeleted: () => _removeIngredient(ingredient),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 30,
            ),
            [
              Container(),
              ElevatedButton(
                onPressed: _findDish,
                child: Text(
                  "Find",
                  style: const TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              )
            ][ingred],
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: ListView.builder(
                  itemCount: recipes_.length,
                  // This should be dynamic based on the actual data
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: OpenContainer(
                              openColor: Colors.black,
                              closedColor: Colors.grey[900]!,
                              closedBuilder: (context, reason) {
                                return Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        alignment: Alignment.center,
                                        height: 100,
                                        width: 200,
                                        child: Text(recipes_[index].name,
                                            maxLines: 5,
                                            style: gettextStyle(20)),
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Image.asset(
                                        veg[recipes_[index].type]!,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              openBuilder: (context, value) {
                                return Scaffold(
                                  backgroundColor: Colors.black,
                                  appBar: AppBar(
                                    title: Text(
                                      recipes_[index].name,
                                      style: getStyle(20),
                                    ),
                                    backgroundColor: Colors.black,
                                    leading: BackButton(color: Colors.white),
                                  ),
                                  body: SingleChildScrollView(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.only(left: 20),
                                            child: Text(
                                              "Website",
                                              style: gettextStyle(15),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              launchUrl(Uri.parse(
                                                  recipes_[index].website));
                                            },
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                recipes_[index].website,
                                                style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontStyle: FontStyle.italic,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.only(left: 20),
                                            child: Image.asset(
                                              veg[recipes_[index].type]!,
                                              height: 50,
                                              width: 50,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.only(left: 20),
                                            child: Text(
                                              "Ingredients needed",
                                              style: gettextStyle(20),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Center(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.9,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Colors.grey[900]),
                                              alignment: Alignment.topLeft,
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                  getStringingredients(
                                                      recipes_[index]
                                                          .ingredients),
                                                  style: gettextStyle(15),
                                                  textAlign: TextAlign.left),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            padding: EdgeInsets.only(left: 20),
                                            child: Text(
                                              "Instructions",
                                              style: gettextStyle(20),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Center(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.9,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Colors.grey[900]),
                                              alignment: Alignment.topLeft,
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                  recipes_[index].instructions,
                                                  style: gettextStyle(15),
                                                  textAlign: TextAlign.left),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                          /*ExpansionTile(
                          title: Text(recipes_[index].name,
                              style: gettextStyle(20)),
                          trailing: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.topLeft,
                              child: Image.asset(
                                veg[recipes_[index].type]!,
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Text(
                              recipes_[index].instructions,
                              style: gettextStyle(10),
                            )
                          ],
                        ),*/
                          ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String getStringingredients(List<String> ingredients) {
  String ing = '';
  for (int i = 0; i < ingredients.length; i++) {
    ing += '* ${ingredients[i]}\n';
  }
  return ing;
}

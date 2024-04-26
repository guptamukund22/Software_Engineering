import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paakshaala/constants/fridge_items.dart';
import 'package:paakshaala/fridge/add_category.dart';
import 'package:paakshaala/fridge/category_card.dart';
import 'package:provider/provider.dart';

class Fridge extends StatefulWidget {
  @override
  State<Fridge> createState() => _FridgeState();
}

class _FridgeState extends State<Fridge> {
  @override
  void initState() {
    // addcategory();
    super.initState();
  }

  addcategory() async {
    CategoryProvider provider = CategoryProvider();
    for (int i = 0; i < categories.length; i++) {
      bool added =
          await provider.addCategory(Category(category: categories[i]));
      print(added);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: /*ChangeNotifierProvider(
        create: (context) => ItemProvided(),
        child: const Fridgehelper(),
      ),*/
            SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50, left: 40),
                alignment: Alignment.topLeft,
                child: Text(
                  "My Fridge",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.libreBaskerville(
                      color: Colors.white, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CategoryCard(category: "Frozens"),
              const SizedBox(
                height: 20,
              ),
              CategoryCard(category: "Dairy"),
              const SizedBox(
                height: 20,
              ),
              CategoryCard(category: "Fruits"),
              const SizedBox(
                height: 20,
              ),
              CategoryCard(category: "Vegetables"),
              const SizedBox(
                height: 20,
              ),
              CategoryCard(category: "Cooked Food"),
              const SizedBox(
                height: 20,
              ),
              CategoryCard(category: "Other Groceries"),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}

/*class Fridgehelper extends StatelessWidget {
  const Fridgehelper({super.key});
  @override
  Widget build(BuildContext context) {
    final item_provider = Provider.of<ItemProvided>(context);
    List<items> items_ = item_provider.get_items();
    return Scaffold(
        body: ListView.builder(
            itemCount: items_.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(items_[index].category),
                subtitle: Text(items_[index].item_name),
              );
            }));
  }
}*/

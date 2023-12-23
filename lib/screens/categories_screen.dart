import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/screens/category_details_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:quiz_app/data/categories_data.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = 'CategoriesScreen';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //* Background Image
          Image.network(
            'https://img.freepik.com/free-vector/elegant-damask-style-pattern-background_1048-11129.jpg?w=740&t=st=1703306231~exp=1703306831~hmac=fd0ec706b4a6dd660611e1792fe6ce7389d857cb1d6b40f6719fcb274215330e',
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 16.0,
            left: 0,
            right: 0,
            child: Column(
              children: <Widget>[
                //*Header Choose Category text
                const Text(
                  'Choose a Category',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),

                //!Categories Content grid view for each item
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.goNamed(CategoryDetailsScreen.routeName);
                        },
                        child: Card(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              //? Grid view Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: categoriesImages[index],
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(color: Colors.white),
                                    );
                                  },
                                ),
                              ),

                              //? Positioned text on grid view image
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    categories[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

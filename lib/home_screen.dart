import 'package:flutter/material.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> recipes = const [
    {
      'name': 'Cumin Lamb Biang Biang Noodles',
      'image': 'assets/images/cumin_lamb.jpg',
      'ingredients': [
        'Wide handmade noodles', 'Lamb slices', 'Cumin seeds', 'Chili oil',
        'Garlic', 'Soy sauce', 'Vinegar', 'Chopped onion', 'Fresh chili',
        'Ginger', 'Leafy greens', 'Cilantro'
      ],
      'instructions':
          'Toast cumin until fragrant. Marinate lamb in soy sauce and oil, then sear until browned. Add aromatics and chili oil, then toss with cooked noodles and greens. Finish with vinegar and cilantro.'
    },
    {
      'name': 'Kimchi Fried Rice',
      'image': 'assets/images/kimchi_fried_rice.jpg',
      'ingredients': [
        'Cooked rice', 'Kimchi', 'Bacon or pork belly', 'Garlic', 'Eggs',
        'Sesame oil', 'Sesame seeds', 'Green onions'
      ],
      'instructions':
          'Fry garlic and bacon until crisp. Add chopped kimchi and cook briefly. Mix in rice and kimchi juice, drizzle sesame oil, then top with a fried egg, sesame seeds, and green onions.'
    },
    {
      'name': 'Pho Noodle Soup',
      'image': 'assets/images/pho_noodles_soup.jpg',
      'ingredients': [
        'Rice noodles', 'Beef broth', 'Sliced beef', 'Onion', 'Ginger',
        'Star anise', 'Cloves', 'Fresh herbs', 'Lime', 'Bean sprouts'
      ],
      'instructions':
          'Char onion and ginger, then simmer with spices in broth. Strain and keep hot. Cook noodles, add to bowl with raw beef slices, and pour broth over to cook the meat. Garnish with herbs, sprouts, and lime.'
    },
    {
      'name': 'Homemade Ramen',
      'image': 'assets/images/ramen.jpg',
      'ingredients': [
        'Ramen noodles', 'Chicken broth', 'Soy sauce', 'Garlic', 'Ginger',
        'Soft-boiled egg', 'Green onions', 'Chicken slices'
      ],
      'instructions':
          'Simmer broth with garlic, ginger, and soy sauce. Cook noodles separately, add to bowl, pour broth over, and top with sliced chicken, egg, and green onions.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Recipe Book',
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.pinkAccent.shade100,
        centerTitle: true,
        elevation: 1,
      ),
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: ListView.builder(
          itemCount: recipes.length,
          padding: const EdgeInsets.all(12.0),
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(recipe: recipe),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        recipe['image'],
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              recipe['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.brown,
                              ),
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, color: Colors.brown, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

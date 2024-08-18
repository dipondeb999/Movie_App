import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<MovieModel> main_movies_list = [
    MovieModel(
      'The Shawshank Redemption',
      1994,
      'assets/images/1.jpg',
      9.3,
    ),
    MovieModel(
      'The Godfather',
      1972,
      'assets/images/2.jpg',
      9.2,
    ),
    MovieModel(
      'The Dark Knight',
      2008,
      'assets/images/3.jpg',
      9.1,
    ),
    MovieModel(
      'The Godfather: Part-II',
      1974,
      'assets/images/4.jpg',
      9.0,
    ),
    MovieModel(
      '12 Angry Men',
      1957,
      'assets/images/5.jpg',
      9.4,
    ),
    MovieModel(
      "Schindler's list",
      1993,
      'assets/images/6.jpg',
      9.5,
    ),
    MovieModel(
      'Pulp Fiction',
      1994,
      'assets/images/7.jpg',
      8.9,
    ),
    MovieModel(
      'The Lord of the Rings: The Followship of the Ring',
      2001,
      'assets/images/8.jpg',
      8.8,
    )
  ];

  List<MovieModel> display_list = List.from(main_movies_list);

  void updateList(String value) {
    setState(() {
      display_list = main_movies_list
          .where((element) =>
              element.movie_title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1f1545),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search for a Movie',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff302360),
                hintText: 'eg: The Dark Knight',
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: display_list.length == 0
                  ? const Center(
                      child: Text(
                        'Result not found',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          title: Text(
                            display_list[index].movie_title!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '${display_list[index].movie_release_year}',
                            style: const TextStyle(color: Colors.white60),
                          ),
                          trailing: Text(
                            '${display_list[index].rating}',
                            style: const TextStyle(color: Colors.amber),
                          ),
                          leading: Image.asset(
                              display_list[index].movie_poster_url!),
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

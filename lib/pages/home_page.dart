import 'package:flutter/material.dart';
import 'package:platina/services/auth_service.dart';
import 'package:platina/services/category_service.dart';
import 'package:platina/services/post_service.dart';
import 'package:platina/models/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var primaryColor = const Color.fromRGBO(29, 48, 104, 1);
  final String username = 'flutter';
  final String password = 'JZgw2rGYBx3r8Zt';

  Future<String> getToken(String username, String password) async {
    final String token = await AuthService.authenticateUser(username, password);
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: FutureBuilder<List<Category>>(
          future: CategoryService.fetchCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final categories = snapshot.data;

              return ListView.builder(
                itemCount: categories!.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return ListTile(
                    title: Text(category.name.toString()),
                  );
                },
              );
            }
          },
        ),
      ),
      appBar: AppBar(
        foregroundColor: primaryColor,
        title: const Image(
          image: AssetImage("assets/images/appBarLogo.png"),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder<List<Post>>(
          future: PostService.fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final posts = snapshot.data;

              return ListView.builder(
                itemCount: posts!.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ListItem(
                    post,
                  );
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Asosiy",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: "Lenta",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart_outlined), label: "Ommabop"),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet_outlined),
            label: "Maqola",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: "Video",
          ),
        ],
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xFF1D3068),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        unselectedItemColor: const Color(0xFFA9AABC),
      ),
    );
  }

  Widget ListItem(Post post) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            width: 408,
            height: 272,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://cp.dev.platina.uz${post.image.toString()}"),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            post.title.toString(),
            style: const TextStyle(
              color: Color.fromRGBO(29, 48, 104, 1),
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'SFProDisplay-Bold',
            ),
          ),
        ],
      ),
    );
  }
}

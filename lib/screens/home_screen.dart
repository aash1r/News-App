import 'package:flutter/material.dart';
import 'package:news_app/data/api.dart';
import 'package:news_app/models/news_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var news = NewsModel();

  @override
  void initState() {
    super.initState();
    getData();
    print(news.articles);
  }

  Future<void> getData() async {
    news = await Api.getNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 360,
                height: 40,
                child: ListTile(
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Search here..",
                        hintStyle: const TextStyle(fontWeight: FontWeight.w100),
                        suffixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  trailing: const Icon(
                    Icons.notification_add,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                leading: Text(
                  "Latest News",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "See All",
                  style: TextStyle(fontSize: 17, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

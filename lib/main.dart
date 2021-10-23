import 'package:flutter/material.dart';
import 'package:travelblog/details.dart';

import 'models/travel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.teal,
          ),
          titleTextStyle: TextStyle(
            color: Colors.teal,
          ),
        ),
        textTheme: TextTheme(
          headline4: TextStyle(
            color: Colors.teal,
          ),
          bodyText1: TextStyle(
            color: Colors.teal,
            fontSize: 20,
          ),
          bodyText2: TextStyle(
            color: Colors.green,
            fontSize: 18,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: TravelBlog(),
    );
  }
}

class TravelBlog extends StatelessWidget {
  TravelBlog({Key? key}) : super(key: key);
  final _list = Travel.travelBlog();
  final _list2 = Travel.mostPopular();

  final _pageCtrl = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Travel Blog',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 2,
            child: PageView.builder(
              controller: _pageCtrl,
              itemCount: _list.length,
              itemBuilder: (context, index) {
                var travel = _list[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(travel: travel),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                          bottom: 30,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            '${travel.url}',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 80,
                        left: 15,
                        child: Column(
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                '${travel.location}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                '${travel.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 30,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Most Popular',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'View All',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.separated(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 15,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: _list2.length,
              separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
              itemBuilder: (context, index) {
                var travel = _list2[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(travel: travel),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          '${travel.url}',
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 15,
                        child: Column(
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                '${travel.location}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                '${travel.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

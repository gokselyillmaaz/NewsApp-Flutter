import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/pages/news_page.dart';
import 'package:news_app/viewmodel/article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: ThemeData.dark().copyWith(
          tabBarTheme: TabBarTheme(
              labelColor: Colors.white, unselectedLabelColor: Colors.red, indicatorSize: TabBarIndicatorSize.label),
          bottomAppBarTheme: const BottomAppBarTheme(shape: CircularNotchedRectangle()),
          progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
          listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )),
      home: ChangeNotifierProvider(
        create: (context) => ArticleListViewModel(),
        child: NewsPage(),
      ),
    );
  }
}

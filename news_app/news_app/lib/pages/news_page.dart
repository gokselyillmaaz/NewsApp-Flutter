import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/viewmodel/article_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: ListView.builder(
          itemCount: vm.viewModel.articles.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Image.network(vm.viewModel.articles[index].urlToImage ??
                      "https://media.istockphoto.com/vectors/error-page-or-file-not-found-icon-vector-id924949200?k=20&m=924949200&s=170667a&w=0&h=-g01ME1udkojlHCZeoa1UnMkWZZppdIFHEKk6wMvxrs="),
                  ListTile(
                    title:
                        Text(vm.viewModel.articles[index].title ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
                    // subtitle: Text(vm.viewModel.articles[index].description ?? ""),
                  ),
                  ButtonBar(
                    children: [
                      MaterialButton(
                        onPressed: () async {
                          await launchUrl(Uri.parse(vm.viewModel.articles[index].url ?? ""));
                        },
                        child: const Text(
                          "Read More",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}

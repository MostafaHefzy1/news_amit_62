import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/model/news_model.dart';
import 'package:news_app/features/news/ui/web_view_screen.dart';

class CustomArticle extends StatelessWidget {
  final Articles articles;

  const CustomArticle({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => WebViewScreen(
                      articles: articles,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 100,
            //   width: 150,
            //   child: Image.network(
            //     cubit.businessNewsModel!.articles![index].urlToImage??"",
            //   ),
            // ),
            SizedBox(
              height: 100,
              width: 150,
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage ?? "",
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Colors.amber[900],
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(articles.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(articles.description ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(articles.author ?? "",
                        style: Theme.of(context).textTheme.displayMedium),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

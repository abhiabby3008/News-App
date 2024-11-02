import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:newsapi/screens/HomeScreen/components/news_details.dart';

class General extends StatefulWidget {
  const General({super.key});

  @override
  _general createState() => _general();
}

class _general extends State<General> {
  late Future<List<dynamic>> _newsArticles;

  @override
  void initState() {
    super.initState();

    _newsArticles = fetchNews();
  }

  Future<List<dynamic>> fetchNews() async {
    NewsRepository newsRepository = NewsRepository();
    final data = await newsRepository.fetchNewsChannelHeadlinesApi();

    return data['articles'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top General Headlines',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _newsArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No articles found.'));
          }

          final articles = snapshot.data!;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return ListTile(
                leading: article['urlToImage'] != null
                    ? Image.network(article['urlToImage'],
                        height: 100, width: 100, fit: BoxFit.cover)
                    : const Icon(Icons.image, size: 100),
                title: Text(
                  article['title'] ?? 'No title',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(article['description'] ?? 'No description'),
                onTap: () {
                  showArticleDetails(context, article);
                },
              );
            },
          );
        },
      ),
    );
  }

  void showArticleDetails(BuildContext context, dynamic article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsDetailScreen(article: article),
      ),
    );
  }
}

class NewsRepository {
  final String apiKey = 'ee67bb73b5e248b19b165937358c0afc';

  Future<Map<String, dynamic>> fetchNewsChannelHeadlinesApi() async {
    String url =
        'https://newsapi.org/v2/top-headlines?category=general&apiKey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      return body;
    } else {
      throw Exception('Failed to load news headlines');
    }
  }
}

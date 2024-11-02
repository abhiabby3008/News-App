import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  final dynamic article;

  const NewsDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['title'] ?? 'Article Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article['urlToImage'] != null)
                Image.network(article['urlToImage']),
              const SizedBox(height: 16),
              Text(
                article['title'] ?? 'No title',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(article['description'] ?? 'No description'),
              const SizedBox(height: 16),
              const Text('Content:'),
              Text(article['content'] ?? 'No content available'),
            ],
          ),
        ),
      ),
    );
  }
}

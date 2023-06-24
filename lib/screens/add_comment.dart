import 'package:assignment/widgets/card_header.dart';
import 'package:assignment/widgets/comment_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key});

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardHeader(),
              SizedBox(height: 16),
              CustomSearchBar(),
              SizedBox(height: 16),
              CommentBar(),
            ],
          ),
        ),
      ),
    );
  }
}

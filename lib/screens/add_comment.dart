import 'dart:convert';

import 'package:assignment/utils/fetch_data.dart';
import 'package:assignment/widgets/card_header.dart';
import 'package:assignment/widgets/comment_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/search_bar.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key});

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  List commentData = [];

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  void updateUI() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('items');
    List localData = [];
    for (int i = 0; i < items!.length; i++) {
      localData.add(json.decode(items[i]));
    }
    setState(() {
      commentData = localData;
    });
  }

  void getAllData() async {
    final FetchData fd = FetchData();
    var data = await fd.getData() as List;
    setState(() {
      commentData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CardHeader(),
              const SizedBox(height: 16),
              const CustomSearchBar(),
              const SizedBox(height: 16),
              Column(
                children: commentData.map((data) {
                  return CommentBar(
                    imgURL: data['thumbnailUrl'],
                    comment: data['title'],
                    trailingIcon: (data['id'] == commentData.length)
                        ? FluentIcons.add_24_filled
                        : FluentIcons.checkmark_24_filled,
                    updateUI: updateUI,
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

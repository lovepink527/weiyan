import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weiyan/public.dart';

import 'package:weiyan/widget/home_widget/post_item.dart';
import 'package:weiyan/model/post.dart';
import 'package:weiyan/widget/home_widget/home_head.dart';

class PostsOverviewScreen extends StatefulWidget {

  @override
  _PostOverviewScreen createState() => _PostOverviewScreen();
}

class _PostOverviewScreen extends State<PostsOverviewScreen> {
  late bool _isLastPage;
  late int _pageNumber;
  late bool _error;
  late bool _loadding;
  final int _numberOfPostsPerRequest = 10;
  late List<Post> _posts;
  final int _nextPageTrigger = 3;

  @override
  void initState() {
    super.initState();
    _pageNumber = 0;
    _posts = [];
    _isLastPage = false;
    _loadding = true;
    _error = false;
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts?_page=$_pageNumber&_limit=$_numberOfPostsPerRequest"
      ));
      List responseList = json.decode(response.body);
      List<Post> postList = responseList.map((data) => Post(data['title'],data['body'])).toList();

      setState(() {
        _isLastPage = postList.length < _numberOfPostsPerRequest;
        _loadding = false;
        _pageNumber = _pageNumber + 1;
        _posts.addAll(postList);
      });
    } catch (e) {
      print("error --> $e");
      setState(() {
        _loadding = false;
        _error = true;
      });
    }
  }

  Widget errordialog({required double size}) {
    return SizedBox(
      height: 180,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('an error occurred when fetching the posts.',
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w500,
            color: Colors.black
          )),
          const SizedBox(height: 10,),
          ElevatedButton(
            child: Text("Retry",
            style: TextStyle(
              fontSize: 20,
              color: Colors.purpleAccent
            ),),
            onPressed: () {
              setState(() {
                _loadding = true;
                _error = false;
                fetchData();
              });
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPostsView()
    );
  }

  Widget buildPostsView() {
    print('buildPostsView');
    if(_posts.isEmpty) {
      if (_loadding) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: CircularProgressIndicator(),
          ),
        );
      }else if (_error) {
        return Center(
          child: errordialog(size: 20),
        );
      }
    }
    return ListView.builder(
      itemCount: _posts.length + (_isLastPage ? 0 : 1),
      itemBuilder: (context, index) {
        print(index);
        if (index == _posts.length - _nextPageTrigger) {
          fetchData();
        }
        if (index == _posts.length) {
          if (_error) {
            return Center(
              child: errordialog(size: 15)
            );
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(),
              ));
            }
          }
        final Post post = _posts[index];
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: PostItem(post.title, post.body)
        );
      }
    );
  }
}
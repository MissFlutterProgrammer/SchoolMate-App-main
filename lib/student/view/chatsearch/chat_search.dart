// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/student/controllers/SearchController.dart'
    as custom;
import 'package:school_management_system/student/models/user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../public/utils/constant.dart';
import '../../resources/chat/chat_api.dart';
import '../Chat/chat_page.dart';

class ChatSearch extends StatelessWidget {
  const ChatSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient: gradientColor),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 12.w, top: 10.h, bottom: 26.5.h),
          child: IconButton(
            onPressed: () => showSearch(
              context: Get.context!,
              delegate: MySearchDelegate(),
            ),
            icon: const Icon(
              Icons.search,
              size: 27,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SafeArea(
        child: StreamBuilder<List<User>>(
          stream: FirebaseApi.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return _buildErrorText('Something Went Wrong Try later');
            }

            final users = snapshot.data ?? [];
            if (users.isEmpty) {
              return _buildErrorText('No Users Found');
            }

            return _buildUserList(users);
          },
        ),
      ),
    );
  }

  Widget _buildUserList(List<User> users) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: users.length,
      itemBuilder: (context, index) => _buildUserTile(users[index]),
    );
  }

  Widget _buildUserTile(User user) {
    return SizedBox(
      height: 75,
      child: ListTile(
        onTap: () => _navigateToChat(user),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(user.urlAvatar ?? ''),
        ),
        title: Text(user.first_name ?? ''),
      ),
    );
  }

  void _navigateToChat(User user) {
    Navigator.of(Get.context!).push<void>(
      MaterialPageRoute<void>(builder: (context) => ChatPage(user: user)),
    );
  }

  Widget _buildErrorText(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  final controller = Get.put(custom.SearchController());
  static const teachersNames = ["Yassin", "osama"];
  static const recentTeachers = [];

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () => query.isEmpty ? close(context, null) : query = '',
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) {
    _onClickSearch(query);
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: controller.searchResult.length,
        itemBuilder: (context, index) =>
            _buildSearchResultTile(controller.searchResult[index]),
      ),
    );
  }

  Widget _buildSearchResultTile(User user) {
    return SizedBox(
      height: 75,
      child: ListTile(
        onTap: () => _navigateToChat(user),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(user.urlAvatar ?? ''),
        ),
        title: Text(user.first_name ?? ''),
      ),
    );
  }

  void _navigateToChat(User user) {
    Navigator.of(Get.context!).push<void>(
      MaterialPageRoute<void>(builder: (context) => ChatPage(user: user)),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentTeachers
        : teachersNames.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) =>
          _buildSuggestionTile(suggestionList[index]),
    );
  }

  Widget _buildSuggestionTile(String suggestion) {
    return ListTile(
      onTap: () => showResults(Get.context!),
      leading: const Icon(Icons.school),
      title: RichText(
        text: TextSpan(
          text: suggestion.substring(0, query.length),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: suggestion.substring(query.length),
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onClickSearch(String query) async {
    await controller.loadSearchByName(query);
  }
}

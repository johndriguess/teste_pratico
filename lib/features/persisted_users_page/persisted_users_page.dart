import 'package:flutter/material.dart';
import 'persisted_users_page_view.dart';

class PersistedUsersPage extends StatefulWidget {
  const PersistedUsersPage({super.key});

  static const route = "/PersistedUsersPage";

  @override
  State<PersistedUsersPage> createState() => PersistedUsersPageView();
}
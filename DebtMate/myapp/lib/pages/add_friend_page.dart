import 'package:flutter/material.dart';
import 'package:myapp/controllers/friend_controller.dart';
import 'package:myapp/controllers/user_controller.dart';
import 'package:myapp/repositories/friend_repository.dart';
import 'package:myapp/repositories/user_repository.dart';
import 'package:myapp/models/responses/user_response.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/utils/toast.dart';

class AddFriendPage extends StatefulWidget {
  const AddFriendPage({super.key});

  @override
  State<AddFriendPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {
  final TextEditingController _searchController = TextEditingController();
  final UserController _userController = UserController(UserRepository());
  final FriendController _friendController = FriendController(FriendRepository());

  List<UserResp> _allUsers = [];
  List<UserResp> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
    _searchController.addListener(_filterUsers);
  }

  Future<void> _fetchUsers() async {
    final users = await _userController.getAllUsers();
    final currentUserId = ApiService.instance.userId;
    final filtered = users.where((user) => user.userId != currentUserId).toList();
    
    setState(() {
      _allUsers = filtered;
      _filteredUsers = filtered;
    });
  }

  void _filterUsers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredUsers = _allUsers
          .where((user) => user.username.toLowerCase().contains(query))
          .toList();
    });
  }

  void addFriend(String userId) {
    final currentUserId = ApiService.instance.userId;

    _friendController.addNewFriend(currentUserId!, userId).then((success) {
      if (success) {
        showToast('Zaproszenie do znajomych wysłane!');
      } else {
        showToast('Nie udało się wysłać zaproszenia.');
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj znajomego', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Szukaj użytkownika...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: _searchController.text.isEmpty
                ? const Center(child: Text('Wpisz nazwę użytkownika, aby wyszukać'))
                : (_filteredUsers.isEmpty
                    ? const Center(child: Text('Brak użytkowników'))
                    : ListView.builder(
                        itemCount: _filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = _filteredUsers[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.cyan,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            title: Text(user.username),
                            trailing: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                addFriend(user.userId);
                              },
                              child: const Text('Dodaj'),
                            ),
                          );
                        },
                      )),
          ),
        ],
      ),
    );
  }
}
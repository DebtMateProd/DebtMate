import 'package:flutter/material.dart';
import 'package:myapp/controllers/friend_controller.dart';
import 'package:myapp/repositories/friend_repository.dart';
import 'package:myapp/models/responses/user_response.dart';
import 'package:myapp/utils/api_service.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final FriendController _friendController = FriendController(FriendRepository());
  List<UserResp> _friends = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchFriends();
  }

  Future<void> _fetchFriends() async {
    final userId = ApiService.instance.userId ?? '';
    final friends = await _friendController.getUserFriends(userId);
    setState(() {
      _friends = friends;
      _loading = false;
    });
  }

  Future<void> _showRemoveDialog(UserResp friend) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Usuń znajomego'),
        content: Text('Czy na pewno chcesz usunąć użytkownika "${friend.username}" ze znajomych?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Nie'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Tak'),
          ),
        ],
      ),
    );
    if (result == true) {
      await _friendController.removeFriend(ApiService.instance.userId!, friend.userId);
      _fetchFriends();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twoi znajomi', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _fetchFriends,
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: _friends.length,
                separatorBuilder: (context, index) => const Divider(height: 24, color: Colors.transparent),
                itemBuilder: (context, index) {
                  final user = _friends[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.cyan,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(user.username),
                      onLongPress: () => _showRemoveDialog(user),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:myapp/controllers/friend_controller.dart';
import 'package:myapp/repositories/friend_repository.dart';
import 'package:myapp/models/responses/user_response.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/utils/toast.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final FriendController _friendController = FriendController(FriendRepository());
  List<UserResp> _friends = [];
  bool _loading = true;

  String? _removingFriendId;


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
        backgroundColor: Colors.cyan,
        title: const Text('Usuń znajomego', style: TextStyle(color: Colors.white),),
        content: Text('Czy na pewno chcesz usunąć użytkownika "${friend.username}" ze znajomych?', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Nie', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Tak', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (result == true) {
      setState(() => _removingFriendId = friend.userId);

       await _friendController.removeFriend(ApiService.instance.userId!, friend.userId);
       await _fetchFriends();

       setState(() => _removingFriendId = null);

       showToast('Usunięto znajomego.');
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
          : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: RefreshIndicator(
                onRefresh: _fetchFriends,
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: _friends.length,
                  separatorBuilder: (context, index) => const Divider(height: 24, color: Colors.transparent),
                  itemBuilder: (context, index) {
                    final user = _friends[index];
                    return Card(
                      color: Colors.cyan.shade400,
                      child: ListTile(
                        leading: _removingFriendId == user.userId
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, color: Colors.cyan),
                          ),
                        title: Text(user.username, style: TextStyle(color: Colors.white),),
                        onTap: () => _showRemoveDialog(user),
                      ),
                    );
                  },
                ),
              ),
          ),
    );
  }
}
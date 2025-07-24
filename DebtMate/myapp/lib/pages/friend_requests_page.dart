import 'package:flutter/material.dart';
import 'package:myapp/controllers/friend_controller.dart';
import 'package:myapp/repositories/friend_repository.dart';
import 'package:myapp/models/responses/user_response.dart';
import 'package:myapp/utils/api_service.dart';

class FriendRequestsPage extends StatefulWidget {
  const FriendRequestsPage({super.key});

  @override
  State<FriendRequestsPage> createState() => _FriendRequestsPageState();
}

class _FriendRequestsPageState extends State<FriendRequestsPage> {
  final FriendController _friendController = FriendController(FriendRepository());
  List<UserResp> _friendRequests = [];
  List<UserResp> _pendingFriends = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final userId = ApiService.instance.userId ?? '';
    final requests = await _friendController.getUserFriendRequests(userId);
    final pending = await _friendController.getUserPendingFriends(userId);
    setState(() {
      _friendRequests = requests;
      _pendingFriends = pending;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twoje zaproszenia', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _fetchData,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Otrzymane zaproszenia:', style: Theme.of(context).textTheme.titleMedium),
                          if (_pendingFriends.isEmpty)
                                const Text('Brak oczekujących zaproszeń.', style: TextStyle(color: Colors.grey)),
                              ..._pendingFriends.map((user) => Card(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.cyan,
                                        child: Icon(Icons.person, color: Colors.white),
                                      ),
                                      title: Text(user.username),
                                      subtitle: const Text('Oczekuje na akceptację'),
                                      trailing: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.cyan,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () async {
                                          await _friendController.acceptFriend(ApiService.instance.userId!, user.userId);
                                          _fetchData();
                                        },
                                        child: const Text('Akceptuj'),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Wysłane zaproszenia (oczekujące):', style: Theme.of(context).textTheme.titleMedium),
                              if (_friendRequests.isEmpty)
                            const Text('Brak zaproszeń.', style: TextStyle(color: Colors.grey)),
                          ..._friendRequests.map((user) => Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.cyan,
                                    child: Icon(Icons.person, color: Colors.white),
                                  ),
                                  title: Text(user.username),
                                ),
                              )),
                            ],
                          ),
                        ],
                    ),
                ],
              ),
            ),
    );
  }
}
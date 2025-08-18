import 'package:flutter/material.dart';
import 'package:myapp/controllers/friend_controller.dart';
import 'package:myapp/repositories/friend_repository.dart';
import 'package:myapp/models/responses/user_response.dart';
import 'package:myapp/utils/api_service.dart';
import 'package:myapp/utils/toast.dart';

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

  String? _acceptingFriendId;

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
          : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: RefreshIndicator(
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
                            Text('Otrzymane zaproszenia:', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                            if (_pendingFriends.isEmpty)
                                  const Text('Brak oczekujących zaproszeń.', style: TextStyle(color: Colors.white70)),
                                ..._pendingFriends.map((user) => Card(
                                      color: Colors.cyan.shade400,
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(Icons.person, color: Colors.cyan),
                                        ),
                                        title: Text(user.username, style: TextStyle(color: Colors.white),),
                                        subtitle: const Text('Oczekuje na akceptację', style: TextStyle(color: Colors.white70)),
                                        trailing: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.cyan,
                                            foregroundColor: Colors.white,
                                          ),
                                          onPressed: _acceptingFriendId == user.userId
                                          ? null // wyłącz przycisk jeśli już trwa akcja
                                          : () async {
                                            await acceptFriendRequest(ApiService.instance.userId!, user.userId);
                                          },
                                          child: _acceptingFriendId == user.userId
                                          ? const SizedBox(
                                              width: 16,
                                              height: 16,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                              ),
                                            )
                                          : const Text('Akceptuj'),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Wysłane zaproszenia (oczekujące):', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                                if (_friendRequests.isEmpty)
                              const Text('Brak zaproszeń.', style: TextStyle(color: Colors.white70)),
                            ..._friendRequests.map((user) => Card(
                                  color: Colors.cyan.shade400,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.person, color: Colors.cyan),
                                    ),
                                    title: Text(user.username, style: TextStyle(color: Colors.white),),
                                  ),
                                )),
                              ],
                            ),
                          ],
                      ),
                  ],
                ),
              ),
          ),
    );
  }

  Future<void> acceptFriendRequest(String userId, String friendId) async {
    setState(() {
      _acceptingFriendId = friendId;
    });

    try {
      await _friendController.acceptFriend(userId, friendId);
      await _fetchData();
      showToast('Zaproszenie zaakceptowane.');
    } catch (e) {
      showToast('Nie udało się zaakceptować zaproszenia.');
    } finally {
      setState(() {
        _acceptingFriendId = null;
      });
    }
  }
}
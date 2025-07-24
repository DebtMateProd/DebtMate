import 'package:myapp/models/responses/user_response.dart';
import 'package:myapp/repositories/friend_repository.dart';
import 'package:openapi/openapi.dart';

class FriendController {
  final FriendRepository _repository;

  FriendController(this._repository);

  Future<bool> addNewFriend(String userId, String friendId) async {
    AddFriendshipRequest request = AddFriendshipRequest((b) {
      b.user1Id = userId;
      b.user2Id = friendId;
    });

    return await _repository.addNewFriend(request);
  }
  
  Future<bool> removeFriend(String userId, String friendId) async {
    RemoveFriendshipRequest request = RemoveFriendshipRequest((b) {
      b.user1Id = userId;
      b.user2Id = friendId;
    });

    return await _repository.removeFriend(request);
  }

  Future<bool> acceptFriend(String userId, String friendId) async {
    AcceptFriendshipRequest request = AcceptFriendshipRequest((b) {
      b.user1Id = userId;
      b.user2Id = friendId;
    });

    return await _repository.acceptFriend(request);
  }

  Future<List<UserResp>> getUserFriends(String userId) async {
    List<UserResponse> users = await _repository.getUserFriends(userId);

    return users.map((user) => UserResp(userId: user.userId ?? "", username: user.userName ?? "")).toList();
  }

  Future<List<UserResp>> getUserPendingFriends(String userId) async {
    List<UserResponse> users = await _repository.getUserPendingFriends(userId);

    return users.map((user) => UserResp(userId: user.userId ?? "", username: user.userName ?? "")).toList();
  }

  Future<List<UserResp>> getUserFriendRequests(String userId) async {
    List<UserResponse> users = await _repository.getUserFriendRequests(userId);

    return users.map((user) => UserResp(userId: user.userId ?? "", username: user.userName ?? "")).toList();
  }

}
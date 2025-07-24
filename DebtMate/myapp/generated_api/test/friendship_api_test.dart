import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for FriendshipApi
void main() {
  final instance = Openapi().getFriendshipApi();

  group(FriendshipApi, () {
    //Future<AddFriendshipResponse> apiFriendshipAddPost({ AddFriendshipRequest addFriendshipRequest }) async
    test('test apiFriendshipAddPost', () async {
      // TODO
    });

    //Future<RemoveFriendshipResponse> apiFriendshipRemovePost({ RemoveFriendshipRequest removeFriendshipRequest }) async
    test('test apiFriendshipRemovePost', () async {
      // TODO
    });

    //Future<GetUserFriendListResponse> apiFriendshipUserIdFriendsGet(String userId) async
    test('test apiFriendshipUserIdFriendsGet', () async {
      // TODO
    });

  });
}

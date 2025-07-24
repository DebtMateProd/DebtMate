import 'dart:developer';

import 'package:myapp/utils/api_service.dart';
import 'package:openapi/openapi.dart';

class FriendRepository {
  final friendApi = ApiService.instance.friendApi;

  Future<bool> addNewFriend(AddFriendshipRequest request) async {
    try {
      final response = await friendApi.apiFriendshipAddPost(addFriendshipRequest: request);

      return response.data?.success ?? false;
    } catch (e) {
      log('Add new friend error: $e');
      return false;
    }
  }

  Future<bool> removeFriend(RemoveFriendshipRequest request) async {
    try {
      final response = await friendApi.apiFriendshipRemovePost(removeFriendshipRequest: request);

      return response.data?.success ?? false;
    } catch (e) {
      log('Remove friend error: $e');
      return false;
    }
  }

  Future<bool> acceptFriend(AcceptFriendshipRequest request) async {
    try {
      final response = await friendApi.apiFriendshipAcceptPost(acceptFriendshipRequest: request);

      return response.data?.success ?? false;
    } catch (e) {
      log('Accept friend error: $e');
      return false;
    }
  }

  Future<List<UserResponse>> getUserFriends(String userId) async {
    try {
      final response = await friendApi.apiFriendshipFriendsUserIdGet(userId: userId);
      
      return response.data?.users?.toList() ?? [];
    } catch (e) {
      log('Get user friends error: $e');
      return [];
    }
  }

  Future<List<UserResponse>> getUserPendingFriends(String userId) async {
    try {
      final response = await friendApi.apiFriendshipPendingfriendsUserIdGet(userId: userId);
      
      return response.data?.users?.toList() ?? [];
    } catch (e) {
      log('Get user pending friends error: $e');
      return [];
    }
  }

  Future<List<UserResponse>> getUserFriendRequests(String userId) async {
    try {
      final response = await friendApi.apiFriendshipFriendrequestsUserIdGet(userId: userId);
      
      return response.data?.users?.toList() ?? [];
    } catch (e) {
      log('Get user friend requests error: $e');
      return [];
    }
  }
}
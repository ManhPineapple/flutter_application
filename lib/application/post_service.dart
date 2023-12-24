import 'package:flutter_application/data/post_repository.dart';
import 'package:flutter_application/domain/post.dart';

class PostService {
  final PostRepository postRepository;

  PostService({required this.postRepository});

  Future<List<Post>> getListPost(dynamic body) async {
    dynamic data =  await postRepository.getListPost(body);
    Map<String, dynamic> dataPost = data["data"];
    List<dynamic> postsJson = dataPost['post'] ?? [];
    return postsJson.map((postJson) => Post.fromJson(postJson)).toList();
  }

  Future<bool> createPost(PostCreate body) async {
    return await postRepository.createPost(body);
  }

  Future<bool> deletePost(String id) async {
    return await postRepository.deletePost(id);
  }

}

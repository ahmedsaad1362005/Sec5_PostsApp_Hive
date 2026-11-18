import 'package:hive/hive.dart';
import '../models/post_model.dart';

class FavoritesService {
  final Box<Post> _box = Hive.box<Post>('favoritesBox');

  void toggleFavorite(Post post) {
    if (_box.containsKey(post.id)) {
      _box.delete(post.id);
    } else {
      final copy = Post(
        id: post.id,
        title: post.title,
        body: post.body,
        userId: post.userId,
      );
      _box.put(post.id, copy);
    }
  }

  bool isFavorite(int id) {
    return _box.containsKey(id);
  }

  List<Post> getFavorites() {
    return _box.values.toList();
  }
}
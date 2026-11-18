import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class PostService {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPosts() async {
    var box = await Hive.openBox<Post>('postsBox');

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<Post> customPosts = [
          Post(
            id: 1, 
            title: 'Eng. Sara Saeed: Section 5 Submission', 
            body: 'Hey everyone, don\'t forget to use Hive for your favorites. I won\'t accept "my internet died" as an excuse this time. Just zip the required files and submit!', 
            userId: 1
          ),
          Post(
            id: 2, 
            title: 'Dr. Mahmoud Gamal: Graduation Project', 
            body: 'Team, we need to wrap up the Model Context Protocol server by this weekend. Let\'s get the AI agents connected. Coordinate your pushes so we don\'t mess up the repo.', 
            userId: 2
          ),
          Post(
            id: 3, 
            title: 'Abdelrahman Hisham: UI is ready', 
            body: 'Bro, the UI is finally done! Just pushed the latest screens. Hook it up with the backend and let me know if the database crashes again lol.', 
            userId: 3
          ),
          Post(
            id: 4, 
            title: 'Dr. Magda Madbouly: Data Security Note', 
            body: 'Please review the encryption concepts we discussed. Most real-world breaches happen because of poor implementation, not just network flaws.', 
            userId: 4
          ),
          Post(
            id: 5, 
            title: 'Mohamed Ahmed: Server update', 
            body: 'Kali is up and running on the VM. Boot up your tools, the test servers are waiting for us tonight. Let\'s get this done.', 
            userId: 5
          ),
          Post(
            id: 6, 
            title: 'Eng. Marwan Medhat: Lab Evaluation', 
            body: 'We will be discussing the Flutter assignments tomorrow. Just a reminder: any copied code gets an automatic zero. Be ready to explain your work.', 
            userId: 6
          ),
          Post(
            id: 7, 
            title: 'Ali Said: CTF Challenge', 
            body: 'Dude, I think I found a vulnerability in the test app. Fire up Burp Suite, let\'s see if we can bypass the login before the CTF ends.', 
            userId: 7
          ),
          Post(
            id: 8, 
            title: 'Dr. Mohamed Khamis: Mobile Computing', 
            body: 'A quick tip for your mobile apps: always separate your UI from your data layer. It makes debugging much easier and keeps your code clean.', 
            userId: 8
          ),
          Post(
            id: 9, 
            title: 'Eng. Eman: Attendance Warning', 
            body: 'Please check your attendance records on the portal. Some of you are dangerously close to the absence limit. Don\'t lose your final grades over this.', 
            userId: 9
          ),
        ];

        await box.clear();
        await box.addAll(customPosts);
        print('Custom Data injected and cached to Hive: ${customPosts.length}');
        return customPosts;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      print('API Failed, reason: $e');

      if (box.isNotEmpty) {
        print('Loaded from Hive offline: ${box.length}');
        return box.values.toList();
      } else {
        throw Exception('No Internet and No Cached Data');
      }
    }
  }
}
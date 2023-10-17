import 'package:flutter/material.dart';
import '../../core/models/post_model.dart';

class UserPostWidget extends StatelessWidget {
  const UserPostWidget({
    super.key,
    required this.post,
    required this.lastPost,
    required this.name,
  });
  final Post post;
  final bool lastPost;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildHeader(),
        const SizedBox(
          height: 2,
        ),
        buildContent(),
      ],
    );
  }

  Widget buildHeader() {
    return IntrinsicHeight(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/dummy_profile.jpeg',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.message,
                        color: Colors.grey.shade500,
                        size: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Commented 2h ago',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildContent() => SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: IntrinsicHeight(
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Visibility(
                        visible: !lastPost,
                        child: Center(
                          child: Container(
                            width: 1.0,
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      post.body,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

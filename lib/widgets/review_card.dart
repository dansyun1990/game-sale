import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:game_sale/models/review.dart';
import 'package:game_sale/pages/game/game_review_detail_page.dart';
import 'package:game_sale/repositories/like_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ReviewCard extends HookConsumerWidget {
  ReviewCard({
    Key? key,
    required this.gameId,
    required this.review,
    this.isDetail = false,
  }) : super(key: key);

  final String gameId;
  final Review review;
  final bool isDetail;

  final likeRepository = LikeRepository();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd H:mm:ss').format(review.createdAt),
                      style: const TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              !isDetail
                  ? HookConsumer(builder: (context, ref, child) {
                      final like = useState(review.like.length);
                      final userId = FirebaseAuth.instance.currentUser!.uid;
                      final liked = useState(review.like.contains(userId));
                      return Row(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(25.0),
                            onTap: () async {
                              if (liked.value) {
                                like.value = like.value - 1;
                                liked.value = false;
                                await likeRepository.deleteLike(
                                    gameId, review.id!, userId);
                              } else {
                                like.value = like.value + 1;
                                liked.value = true;
                                await likeRepository.addLike(
                                    gameId, review.id!, userId);
                              }
                            },
                            child: Icon(
                              liked.value
                                  ? Icons.thumb_up
                                  : Icons.thumb_up_outlined,
                              size: 16.0,
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text(
                              like.value.toString(),
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      );
                    })
                  : Container(),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (!isDetail) {
              Navigator.push(
                context,
                MaterialPageRoute<bool>(
                  builder: (BuildContext context) =>
                      GameReviewDetailPage(gameId: gameId, review: review),
                ),
              );
            }
          },
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 3.0),
            child: Text(
              review.content,
              maxLines: !isDetail ? 3 : null,
              style: TextStyle(
                fontSize: 14.0,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black54
                    : Colors.white60,
                overflow: !isDetail ? TextOverflow.ellipsis : null,
              ),
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}

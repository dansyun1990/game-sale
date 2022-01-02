import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:game_sale/constants/game_clear_time.dart';
import 'package:game_sale/constants/game_difficulty.dart';
import 'package:game_sale/constants/game_progress.dart';
import 'package:game_sale/generated/l10n.dart';
import 'package:game_sale/models/review.dart';
import 'package:game_sale/providers/review_provider.dart';
import 'package:game_sale/repositories/review_repository.dart';
import 'package:game_sale/utils/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GameReviewPage extends HookConsumerWidget {
  GameReviewPage({
    Key? key,
    required this.gameId,
    required this.name,
    required this.subName,
    this.review,
  }) : super(key: key);

  final String gameId;
  final String name;
  final String subName;
  final Review? review;

  final reviewRepository = ReviewRepository();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (review != null) {
      ref.watch(ratingSelectorProvider.notifier).state = review!.rating;
    }
    if (review?.difficulty != null) {
      ref.watch(difficultySelectorProvider.notifier).state = GameDifficulty
          .values
          .firstWhere((difficulty) => difficulty.key == review?.difficulty);
    }
    if (review?.progress != null) {
      ref.watch(progressSelectorProvider.notifier).state = GameProgress.values
          .firstWhere((progress) => progress.key == review?.progress);
    }
    if (review?.clearTime != null) {
      ref.watch(clearTimeSelectorProvider.notifier).state = GameClearTime.values
          .firstWhere((clearTime) => clearTime.key == review?.clearTime);
    }
    final reviewController = useTextEditingController(text: review?.content);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).gameReview),
        actions: [
          review != null
              ? IconButton(
                  icon: const Icon(Icons.delete_forever),
                  onPressed: () async {
                    showLoaderDialog(context);
                    await reviewRepository.deleteReview(
                      gameId: gameId,
                      reviewId: review!.id!,
                    );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('レビューを削除しました。'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                    Navigator.pop(context);
                  },
                )
              : Container(),
          IconButton(
            icon: const Icon(Icons.rate_review),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final rating = ref.watch(ratingSelectorProvider.notifier).state;

                if (rating != 0.0) {
                  showLoaderDialog(context);

                  final progress =
                      ref.watch(progressSelectorProvider.notifier).state;

                  await reviewRepository.addReview(
                    gameId: gameId,
                    reviewId: review?.id,
                    rating: rating,
                    content: reviewController.text,
                    difficulty: ref
                        .watch(difficultySelectorProvider.notifier)
                        .state
                        ?.key,
                    progress: progress?.key,
                    clearTime: progress == GameProgress.clear ||
                            progress == GameProgress.complete
                        ? ref
                            .watch(clearTimeSelectorProvider.notifier)
                            .state
                            ?.key
                        : null,
                  );
                  Navigator.pop(context);

                  if (review == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('レビューを投稿しました。'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('レビューを更新しました。'),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }

                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('点数をつけてください'),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          subName,
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                          ),
                        ),
                        const Divider(),
                        HookConsumer(builder: (context, ref, child) {
                          return RatingBar.builder(
                            initialRating: review?.rating ?? 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              ref.watch(ratingSelectorProvider.notifier).state =
                                  rating;
                            },
                          );
                        }),
                        const Divider(),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: reviewController,
                            maxLines: null,
                            maxLength: 512,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              helperText: S.of(context).reviewHelper,
                              hintText: S.of(context).reviewMessage,
                              suffixIcon: IconButton(
                                onPressed: () => reviewController.clear(),
                                icon: const Icon(Icons.clear),
                              ),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return S.of(context).reviewMessage;
                              }
                              if (value.length < 10) {
                                return S.of(context).reviewLength;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Difficulty(),
              const SizedBox(height: 8.0),
              const Progress(),
              const SizedBox(height: 8.0),
              const ClearTime(),
            ],
          ),
        ),
      ),
    );
  }
}

class Difficulty extends HookConsumerWidget {
  const Difficulty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0.0,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).gameDifficulty,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              HookConsumer(builder: (context, ref, child) {
                return Wrap(
                  spacing: 6.0,
                  children: List<Widget>.generate(GameDifficulty.values.length,
                      (index) {
                    final difficulty = GameDifficulty.values.elementAt(index);
                    return ChoiceChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      label: Text(difficulty.value),
                      labelStyle: const TextStyle(
                        fontSize: 13.0,
                      ),
                      selected:
                          ref.watch(difficultySelectorProvider.state).state ==
                              difficulty,
                      selectedColor: Colors.redAccent,
                      onSelected: (selected) {
                        ref.watch(difficultySelectorProvider.notifier).state =
                            selected ? difficulty : null;
                      },
                    );
                  }),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class Progress extends HookConsumerWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0.0,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).gameProgress,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              HookConsumer(builder: (context, ref, child) {
                return Wrap(
                  spacing: 6.0,
                  children: List<Widget>.generate(GameProgress.values.length,
                      (index) {
                    final progress = GameProgress.values.elementAt(index);
                    return ChoiceChip(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      label: Text(progress.value),
                      labelStyle: const TextStyle(
                        fontSize: 13.0,
                      ),
                      selected:
                          ref.watch(progressSelectorProvider.state).state ==
                              progress,
                      selectedColor: Colors.redAccent,
                      onSelected: (selected) {
                        ref.watch(progressSelectorProvider.notifier).state =
                            selected ? progress : null;
                      },
                    );
                  }),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class ClearTime extends HookConsumerWidget {
  const ClearTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProgress = ref.watch(progressSelectorProvider.state).state;

    return selectedProgress == GameProgress.clear ||
            selectedProgress == GameProgress.complete
        ? Card(
            elevation: 0.0,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).clearTime,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    HookConsumer(builder: (context, ref, child) {
                      return Wrap(
                        spacing: 6.0,
                        children: List<Widget>.generate(
                            GameClearTime.values.length, (index) {
                          final clearTime =
                              GameClearTime.values.elementAt(index);
                          return ChoiceChip(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            label: Text(clearTime.value),
                            labelStyle: const TextStyle(
                              fontSize: 13.0,
                            ),
                            selected: ref
                                    .watch(clearTimeSelectorProvider.state)
                                    .state ==
                                clearTime,
                            selectedColor: Colors.redAccent,
                            onSelected: (selected) {
                              ref
                                  .watch(clearTimeSelectorProvider.notifier)
                                  .state = selected ? clearTime : null;
                            },
                          );
                        }),
                      );
                    }),
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}

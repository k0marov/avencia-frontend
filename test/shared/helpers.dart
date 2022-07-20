import 'dart:math';

import 'package:avencia/logic/core/error/failures.dart';
import 'package:avencia/logic/features/deposit/domain/entities.dart';
import 'package:dartz/dartz.dart';
import 'package:english_words/english_words.dart' as english_words;

String randomNoun() => english_words.nouns[Random().nextInt(english_words.nouns.length)];
String randomAdjective() => english_words.adjectives[Random().nextInt(english_words.adjectives.length)];
String randomString() => randomAdjective() + " " + randomNoun();

DateTime randomTime() =>
    DateTime.fromMicrosecondsSinceEpoch((DateTime.now().millisecondsSinceEpoch / 1000000).floor() * 1000000)
        .toUtc(); // this gives accuracy to seconds
int randomInt() => Random().nextInt(100);
bool randomBool() => Random().nextDouble() > 0.5;

NetworkFailure randomNetworkFailure() => NetworkFailure(
      400 + Random().nextInt(100),
      randomString(),
    );

Failure randomFailure() => randomBool() ? randomNetworkFailure() : NoTokenFailure();

TransactionCode randomTransactionCode() => TransactionCode(randomString(), randomTime());

T forceRight<T>(Either<Failure, T> target) {
  late final T result;
  target.fold(
    (failure) => throw Exception("wanted target to be Right, but got Left value = " + failure.toString()),
    (successRes) => result = successRes,
  );
  return result;
}

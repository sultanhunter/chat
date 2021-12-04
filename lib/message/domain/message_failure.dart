import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_failure.freezed.dart';

@freezed
class MessageFailure with _$MessageFailure {
  const MessageFailure._();
  const factory MessageFailure.stream() = _Stream;
  const factory MessageFailure.send() = _Send;
}

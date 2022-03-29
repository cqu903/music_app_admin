import 'package:json_annotation/json_annotation.dart';

part 'MusicCreateRequest.g.dart';

@JsonSerializable()
class MusicCreateRequest {
  String name;
  String description;

  MusicCreateRequest({required this.name, required this.description});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory MusicCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$MusicCreateRequestFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MusicCreateRequestToJson(this);
}

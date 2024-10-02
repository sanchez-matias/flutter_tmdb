import 'package:flutter_tmdb/src/tmdb/domain/entities/title_account_state.dart';

class TitleAccountStateModel extends TitleAccountState {
  TitleAccountStateModel({
    required super.isFavorite,
    required super.raiting,
    required super.isInWatchlist,
  });

  factory TitleAccountStateModel.fromJson(Map<String, dynamic> json) =>
      TitleAccountStateModel(
        isFavorite: json['favorite'],
        raiting: json['rated'] == false
          ? null
          : json['rated']['value'].toInt(),
        isInWatchlist: json['watchlist'],
      );
}

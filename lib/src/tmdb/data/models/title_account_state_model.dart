import 'package:flutter_tmdb/src/tmdb/domain/entities/title_account_state.dart';

class TitleAccountStateModel extends TitleAccountState {
  TitleAccountStateModel({
    required super.isFavorite,
    required super.isRated,
    required super.isInWatchlist,
  });

  factory TitleAccountStateModel.fromJson(Map<String, dynamic> json) =>
      TitleAccountStateModel(
        isFavorite: json['favorite'],
        isRated: json['rated'] == false
          ? false
          : true,
        isInWatchlist: json['watchlist'],
      );
}

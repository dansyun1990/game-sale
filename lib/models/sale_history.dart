import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_sale/utils/converter.dart';

part 'sale_history.freezed.dart';
part 'sale_history.g.dart';

@freezed
class SaleHistory with _$SaleHistory {
  const factory SaleHistory({
    required String saleStart,
    required String saleEnd,
    required int basePrice,
    required int salePrice,
    @TimestampConverter() required DateTime createdAt,
  }) = _SaleHistory;

  factory SaleHistory.fromJson(Map<String, dynamic> json) =>
      _$SaleHistoryFromJson(json);

  factory SaleHistory.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return SaleHistory.fromJson(data);
  }
}

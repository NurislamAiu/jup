import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jup/features/home/domain/entities/moment.dart';

class MomentModel extends Moment {
  MomentModel({
    required super.id,
    required super.date,
    required super.dressCode,
    required super.status,
  });

  factory MomentModel.fromSnapshot(DocumentSnapshot snap) {
    var data = snap.data() as Map<String, dynamic>;
    return MomentModel(
      id: snap.id,
      date: (data['date'] as Timestamp).toDate(),
      dressCode: data['dressCode'] ?? 'Не указан',
      status: (data['status'] == 'ready') ? MomentStatus.ready : MomentStatus.preparing,
    );
  }
}

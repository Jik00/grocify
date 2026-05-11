import 'package:grocify/generated/l10n.dart';

class StepEntity {
  final String num;
  final String title;

  StepEntity({required this.num, required this.title});
}

List<StepEntity> get stepsEntities => [
      StepEntity(num: '1', title: S.current.delivery),
      StepEntity(num: '2', title: S.current.location),
      StepEntity(num: '3', title: S.current.payment),
      StepEntity(num: '4', title: S.current.confirmation),
    ];
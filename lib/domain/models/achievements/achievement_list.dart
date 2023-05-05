import 'package:splyshechka/domain/models/achievements/achievement.dart';
import 'package:splyshechka/utils/app_images.dart';

abstract class Achievements {
  static const String notAchievedImage = "assets/images/question.png";

  static final achievements = [
    const Achievement(
      headerText: "По госту",
      description: "Проспать 8-9 часов.",
      image: AppImages.woodSword,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
    ),
    const Achievement(
      headerText: "Зовите меня крутой",
      description: "Проспать 8-9 часов 3 дня подряд.",
      image: AppImages.ironSword,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
    ),
    const Achievement(
      headerText: "Кто, если не я?",
      description: "Проспать 8-9 часов 7 дней подряд.",
      image: AppImages.goldenSword,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
    ),
    const Achievement(
      headerText: "Последний герой",
      description: "Проспать 8-9 часов 28 дней подряд.",
      image: AppImages.diamonSword,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
    ),
    const Achievement(
      headerText: "Дипломат",
      description:
          "Выключить будильник через некоторое время после его срабатывания.",
      image: AppImages.book,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
    ),
    const Achievement(
      headerText: "Шестое чувство",
      description:
          "Проснуться за 20 и меньше минут до срабатывания будильника.",
      image: AppImages.crystal,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
    ),
    const Achievement(
      headerText: "Маленький манёвр",
      description: "Поставить будильник на 15 и меньше минут.",
      image: AppImages.portal,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
    ),
    const Achievement(
      headerText: "Да не умер он",
      description: "Проспать будильник.",
      image: AppImages.gast,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
    ),
    const Achievement(
      headerText: "Аналитик",
      description: "Открыть статистику.",
      image: AppImages.redstone,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
    ),
    const Achievement(
      headerText: "Сладкий сон",
      description: "Проспать 11 и больше часов за день.",
      image: AppImages.bed,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
    ),
    const Achievement(
      headerText: "Исчезнувший",
      description: "Не ложиться спать.",
      image: AppImages.endPortal,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
    ),
    const Achievement(
      headerText: "Проклятие",
      description: "Проспать 4-6 часов.",
      image: AppImages.spiderEye,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
    ),
    const Achievement(
      headerText: "Цыганские фокусы",
      description: "Лечь 2 раза спать за день.",
      image: AppImages.apple,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
    ),
  ];
}

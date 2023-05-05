import 'package:splyshechka/data/model/achievement/achievement_dto.dart';
import 'package:splyshechka/utils/app_images.dart';

abstract class Achievements {
  static const String notAchievedImage = "assets/images/question.png";

  static final achievements = [
    const AchievementDto(
      headerText: "Аналитик",
      description: "Открыть статистику.",
      image: AppImages.redstone,
      isAchieved: true,
      counter: 0,
      finalCount: 1,
      index: 1,
    ),
    const AchievementDto(
      headerText: "Сладкий сон",
      description: "Проспать 11 и больше часов за день.",
      image: AppImages.bed,
      isAchieved: true,
      counter: 0,
      finalCount: 1,
      index: 2,
    ),
    const AchievementDto(
      headerText: "По госту",
      description: "Проспать 8-9 часов.",
      image: AppImages.woodSword,
      isAchieved: true,
      counter: 0,
      finalCount: 1,
      index: 3,
    ),
    const AchievementDto(
      headerText: "Зовите меня крутой",
      description: "Проспать 8-9 часов 3 дня.",
      image: AppImages.ironSword,
      isAchieved: true,
      counter: 0,
      finalCount: 3,
      index: 4,
    ),
    const AchievementDto(
      headerText: "Кто, если не я?",
      description: "Проспать 8-9 часов 7 дней.",
      image: AppImages.goldenSword,
      isAchieved: true,
      counter: 0,
      finalCount: 7,
      index: 5,
    ),
    const AchievementDto(
      headerText: "Последний герой",
      description: "Проспать 8-9 часов 28 дней.",
      image: AppImages.diamonSword,
      isAchieved: true,
      counter: 0,
      finalCount: 28,
      index: 6,
    ),
     const AchievementDto(
      headerText: "Проклятие",
      description: "Проспать 4-6 часов.",
      image: AppImages.spiderEye,
      isAchieved: true,
      counter: 0,
      finalCount: 1,
      index: 7,
    ),
    ///////////////////////
    const AchievementDto(
      headerText: "Дипломат",
      description:
          "Выключить будильник через некоторое время после его срабатывания.",
      image: AppImages.book,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
      index: 0,
    ),
    const AchievementDto(
      headerText: "Шестое чувство",
      description:
          "Проснуться за 20 и меньше минут до срабатывания будильника.",
      image: AppImages.crystal,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
      index: 0,
    ),
    const AchievementDto(
      headerText: "Маленький манёвр",
      description: "Поставить будильник на 15 и меньше минут.",
      image: AppImages.portal,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
      index: 0,
    ),
    const AchievementDto(
      headerText: "Да не умер он",
      description: "Проспать будильник.",
      image: AppImages.gast,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
      index: 0,
    ),
    const AchievementDto(
      headerText: "Исчезнувший",
      description: "Не ложиться спать.",
      image: AppImages.endPortal,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
      index: 0,
    ),
    const AchievementDto(
      headerText: "Цыганские фокусы",
      description: "Лечь 2 раза спать за день.",
      image: AppImages.apple,
      isAchieved: false,
      counter: 0,
      finalCount: 0,
      index: 0,
    ),
  ];
}

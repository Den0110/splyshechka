import 'package:splyshechka/models/achievements/achievement.dart';
import 'package:splyshechka/utils/app_images.dart';

abstract class Achievements{

  static const String notAchievedImage = "assets/images/question.png";

  static final achievements = [
    Achievement(headerText: "По госту", description: "Проспать 8-9 часов.",image: AppImages.woodSword,isAchieved: true),
    Achievement(headerText: "Зовите меня крутой", description: "Проспать 8-9 часов 3 дня подряд.",image: AppImages.ironSword),
    Achievement(headerText: "Кто, если не я?", description: "Проспать 8-9 часов 7 дней подряд.",image: AppImages.goldenSword),
    Achievement(headerText: "Последний герой", description: "Проспать 8-9 часов 28 дней подряд.",image: AppImages.diamonSword),
    Achievement(headerText: "Дипломат", description: "Выключить будильник через некоторое время после его срабатывания.", image: AppImages.book,isAchieved: true),
    Achievement(headerText: "Шестое чувство", description: "Проснуться за 20 и меньше минут до срабатывания будильника.",image: AppImages.crystal,isAchieved: true),
    Achievement(headerText: "Маленький манёвр", description: "Поставить будильник на 15 и меньше минут.",image: AppImages.portal,isAchieved: true),
    Achievement(headerText: "Да не умер он", description: "Проспать будильник.",image: AppImages.gast,isAchieved: true),
    Achievement(headerText: "Аналитик", description: "Открыть статистику.",image: AppImages.redstone),
    Achievement(headerText: "Сладкий сон", description: "Проспать 11 и больше часов за день.",image: AppImages.bed),
    Achievement(headerText: "Исчезнувший", description: "Не ложиться спать.",image: AppImages.endPortal),
    Achievement(headerText: "Проклятие", description: "Проспать 4-6 часов.",image: AppImages.spiderEye,isAchieved: true),
    Achievement(headerText: "Цыганские фокусы", description: "Лечь 2 раза спать за день.",image: AppImages.apple,isAchieved: true),
  ];
}
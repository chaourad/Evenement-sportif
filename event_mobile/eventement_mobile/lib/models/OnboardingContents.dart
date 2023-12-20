class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Suivez votre Performance Sportive",
    image: "assets/images/image1.png",
    desc:
        "Gardez un œil sur vos performances sportives et vos progrès personnels.",
  ),
  OnboardingContents(
    title: "Organisez Votre Équipe Sportive",
    image: "assets/images/image2.png",
    desc:
        "Restez coordonné avec votre équipe pour des entraînements et des stratégies efficaces.",
  ),
  OnboardingContents(
    title: "Soyez Alerté des Événements Sportifs",
    image: "assets/images/image3.png",
    desc:
        "Recevez des notifications pour les matchs à venir, les changements d'horaire et plus encore.",
  ),
];

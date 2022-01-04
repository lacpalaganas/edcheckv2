class OnboardingContent {
  late String image;
  late String title;
  late String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'We Check & Correct It',
      image: 'assets/images/edcheck-img-2.png',
      description:
          "We can now re-do your \n assignment knowing the right ways to get it all done. Turn it in and get that A+."),
  OnboardingContent(
      title: 'Your Work Is In Good Hands',
      image: 'assets/images/edcheck-img-2.png',
      description:
          "EdCheck has the best academics in the world checking your work."),
  OnboardingContent(
      title: 'Ready For an A+?',
      image: 'assets/images/edcheck-img-2.png',
      description: "Signup now to get started."),
];

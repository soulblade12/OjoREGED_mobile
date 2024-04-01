class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Schedule Trash Pickups with Ease',
      image: 'assets/onboarding/Asset5.png',
      discription: "Simply schedule your trash pickups at your convenience, and we'll take care of the rest."
  ),
  UnbordingContent(
      title: 'Never Miss a Pickup Again',
      image: 'assets/onboarding/Asset6.png',
      discription: "Say goodbye to overflowing trash bins! Our app sends you timely reminders so you never miss a pickup schedule."
  ),
  UnbordingContent(
      title: 'Welcome to Trash Pickup OjoREGED',
      image: 'assets/onboarding/Asset10.png',
      discription: "your ultimate solution for scheduling hassle-free trash pickups right at your doorstep."
  ),
];
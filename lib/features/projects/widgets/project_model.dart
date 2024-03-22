class Project {
  final String name;
  final String description;
  final String image;
  final String link;
  Project(this.name, this.description, this.image, this.link);
}

List<Project> projectList = [
  Project(
    'Coffee Application',
    'Presenting "Coffee" - a Flutter UI application that invites you to indulge in a delightful coffee adventure. Immerse yourself in the world of rich aroma and flavor as you browse through an exquisite selection of specialty coffees. With a user-friendly interface, exploring different blends and discovering their unique details becomes a delightful experience.',
    'assets/images/coffee.png',
    'https://github.com/Hamad-Anwar/Coffe-Shop-Beautifull-UI',
  ),
  Project(
    'Car Controller Application UI',
    'Car Control Dashboard is a user-friendly mobile application built using Flutter and powered by GetX for efficient state management. Enjoy a modern and intuitive design that adapts to various screen sizes, Interact with dynamic car controls, including speed, steering, and temperature. Realistic animations enhance the visual appeal, making it feel like you are controlling a real car!',
    'assets/images/car.png',
    'https://github.com/Hamad-Anwar/Car-Controller-Getx-Flutter',
  ),
 
];

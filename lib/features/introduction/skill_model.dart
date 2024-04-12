class SkillItems {
  final double percentage;
  final String title;
  final String image;

  SkillItems({
    required this.percentage,
    required this.title,
    required this.image,
  });
}

class ProgressData {
  static List<Map<String, dynamic>> progressData = [
    {
      'percentage': 0.8,
      'title': 'Flutter',
      'image': 'assets/flutter.png',
    },
    {
      'percentage': 0.8,
      'title': 'Dart',
      'image': 'assets/dart.png',
    },
    {
      'percentage': 0.7,
      'title': 'Firebase',
      'image': 'assets/firebase.png',
    },
    {
      'percentage': 0.85,
      'title': 'Sqlite',
      'image': 'assets/dart.png',
    },
    {
      'percentage': 0.8,
      'title': 'Responsive Design',
      'image': 'assets/flutter.png',
    },
    {
      'percentage': 0.9,
      'title': 'Clean Architecture',
      'image': 'assets/flutter.png',
    },
    {
      'percentage': 0.7,
      'title': 'Bloc',
      'image': 'assets/bloc.png',
    },
    {
      'percentage': 0.75,
      'title': 'Getx',
      'image': 'assets/dart.png',
    },
    {
      'percentage': 0.9,
      'title': 'Provider',
      'image': 'assets/dart.png',
    },
     {
      'percentage': 0.40,
      'title': 'TensorFlow',
      'image': 'assets/Tensorflow.png',
    },
  ];
  // assets/Tensorflow.png

  static List<SkillItems> getSkillItems() {
    return progressData.map((item) {
      return SkillItems(
        percentage: item['percentage'],
        title: item['title'],
        image: item['image'],
      );
    }).toList();
  }
}

// Access the progress items

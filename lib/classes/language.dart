class Language {
  final int id;
  final String name;
  final String languageCode;

  Language({this.id, this.languageCode, this.name});

  static List<Language> languageList() {
    return <Language>[
      Language(id: 1, languageCode: "ar", name: "العربية"),
      Language(id: 2, languageCode: "en", name: "English"),
    ];
  }
}

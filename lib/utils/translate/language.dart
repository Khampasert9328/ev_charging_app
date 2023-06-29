class Language {
  final int id;
  final String flag;
  final String name;
  final String?languageCode;

  Language(this.id,  this.flag,  this.name,  this.languageCode);

  static List<Language> languagelist() {
    return <Language>[
      Language(1, "🇱🇦",  "Laos","lo"),
      Language(2, "🏴󠁧󠁢󠁥󠁮󠁧󠁿",  "English", "en"),
    ];
  }
}

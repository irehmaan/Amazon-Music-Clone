class Constants {
  static String getURL(String singerName) {
    return "https://itunes.apple.com/search?term=$singerName&limit=40&entity=musicTrack&country=IN";
  }

  static String getTrend(String trending) {
    return "https://itunes.apple.com/search?term=$trending&entity=musicTrack";
  }

  static const Singers_URL =
      "https://irehmaan.github.io/demoserverdata/singers_data.json";

  static String getPodcasts() {
    return "https://itunes.apple.com/search?term=podcasts&entiity=podcast&country=IN";
  }

  static const keywords = [
    "Maroon 5",
    "Vishal Mishra",
    "jubin nautiyal",
    "MetroBoomin",
  ];
}

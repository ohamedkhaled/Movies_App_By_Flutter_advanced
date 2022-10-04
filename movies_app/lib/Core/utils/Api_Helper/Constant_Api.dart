class ConstantApi{
  static final String Key="a9cb6e105a9c613ab883309a5efe13aa";
  static final String BaseUrl ="https://api.themoviedb.org/3";
  static final String OnAirUrl="${BaseUrl}/tv/on_the_air?api_key=${Key}";
  static final String PopulerTvUrl="${BaseUrl}/tv/popular?api_key=${Key}";
  static final String TopRateTvUrl="${BaseUrl}/tv/top_rated?api_key=${Key}";
  static final String playNowUrl="${BaseUrl}/movie/now_playing?api_key=${Key}";
  static final String pupularUrl="${ConstantApi.BaseUrl}/movie/popular?api_key=${ConstantApi.Key}";
  static final String TopRateUrl="${ConstantApi.BaseUrl}/movie/top_rated?api_key=${ConstantApi.Key}";
  static final String BaseUrlImage="https://image.tmdb.org/t/p/w500";
  String getMovieDetailUrl(int id)=>"$BaseUrl/movie/$id?api_key=$Key";
  String getMovieRecommendtionUrl(int id)=>"$BaseUrl/movie/$id/recommendations?api_key=$Key";
  String getTvDetailUrl(int id)=>"${BaseUrl}/tv/$id?api_key=$Key";
  String getTvEpisodesUrl(int id,int seasonNumber)=>"${BaseUrl}/tv/$id/season/$seasonNumber?api_key=$Key";
  String getTvReccommendationsUrl(int id)=>"${BaseUrl}/tv/$id/recommendations?api_key=$Key";
  String getImageUrl(String path)=> "$BaseUrlImage$path";

}

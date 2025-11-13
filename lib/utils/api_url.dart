class ApiUrl {
  static const String baseUrl = "https://api.zhndev.site/wp-json/blog-app/v1";
  static const String regUrl = "$baseUrl/auth/register";
  static const String loginUrl = "$baseUrl/auth/login";
  static const String logoutUrl = "$baseUrl/auth/logout";
  static const String profileUrl = "$baseUrl/user/profile";
  static const String changePassUrl = "$baseUrl/user/change-password";
  static const String postUrl = "$baseUrl/posts";
  static const String commentUrl = "$baseUrl/comments";
  static const String getCommentUrl = "$baseUrl/comments/post/";
}
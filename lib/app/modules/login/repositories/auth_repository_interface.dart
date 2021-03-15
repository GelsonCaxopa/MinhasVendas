abstract class IAuthRepository {
  Future getUser();
  Future getGoogleLogin();
  Future getEmailLogin();
  Future<String> getToken();
}

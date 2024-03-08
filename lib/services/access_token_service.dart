import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

mixin AccessTokenService {
  Future<String> getAccessToken() async {
    final serviceAccountCredentials = ServiceAccountCredentials.fromJson({
      "type": "service_account",
      "project_id": "stories-backend-system",
      "private_key_id": "731aaeb691dc0e54ba3f035d64fc7e9ed02a1553",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDVllr6WpBO00aE\nE3eBiZjnHhRZTNekeNW818aubc+oC1/4UUvtDhTQ1LFw20gytLWxxgZIjGGeK3HE\naNSGWNUVmQmOliRz0ZPJeTsShiv+7bVRDXQwdcwvfqfZq27E4fuuF3yIuOMZ8QFL\n5IlEFW+Ucgj3iXGa69HiAQSOOh3SELMJfUTgUm007suxdGJ86zONl3S/BsxQXxl5\nVcA3n+xs/4kNSdirb/pm4MqiCU5ZzButOkXcjgzJzHNRu+tu3CNze0msZuJL6UOR\nwVIxY12Q+jjYt+3abpa9VuWkauyo7KTbOFmbCFIXZyk1JHx7IpyIxif7xc9Oe0ZB\nT96EoSkJAgMBAAECggEAB/WZr9UypgFZEiBwlmb0h/5Wt0o2CgbHvkkTOhpU//fm\njGgpKm0ZKPwYHbLKQrt5vuV4g/kZRS3syCs46kXCsRKaKNJfCuLfPUWThjnyR0Z/\n+ISGFS06nfV8F1A8aUFboe31odmz+tpAmF2soNkkppVGUMUyMtoBYQj1LMCtLlAI\nEj91WWMk8gUtDpWywiS7gJMwg7sykMnpLNjKN/+rgzVU1u2N76RpZR9+3aTzop/5\nFfQS/q+odacgJB4DTE48IKPmUiWCBRT0w2iqWa6kuM4Bsb5DKtO4aGL9cQrYpLX5\n+cncq8W9XetVEmCDXWD0F3Vx5azzp1PXbRcdrl4uZQKBgQDr4bRG+X/Un/bm2SpS\nFv0m8tvHS2ICnaVNmP9ZGwZvWJhEMZjTrjXcjOcCixaiS9ApZSshA1P+FtL6AhJp\nnoJ/z2SbmlKSmXAosJUXP76k87UuXZjaFzphLma4annMWhkHkrJDIWKlsRxXlFmS\nW21QqlScc2B8afFnU2Qd2i1+rQKBgQDnzd8ZVCA1JD8V89tWMxesm7V1HllqmbO/\nKnngwLw8VsxCZNXMwhJBHsa1Y/wM7YEgR5IY80JFR0mvDyDhnQlhF61xgVbG3qGv\n5ba5erKy2sagYCJqJvQIrv9/o4TuWsOBNz7JjGSyHzPWdELHVaGyp80zQrSWL1r2\nfsDg37crTQKBgFUh17PJ9pXhyfWVKU4JWAKHokSyc0Qoa3GvJ3GcbF0hZ4stL1Au\nzuezvuhPFLMsk4ttJPy8O8M3r5tlxglymPzR+CiksOqSEEXPPW/vpLnZ72k1hKYp\nvfs3CQHEBAN5/RCbpFTQJs9QNb9yHkXRU4nKf9EbXxZoEiVNlpOjm8ndAoGACnV6\nhH0MOvmYsxfepKQHhG0+Ibut0yZ+Orji6OYpWBueebxs/SEgi7mkw5hwTfEFa3xv\nNhr7uX5+75wiIqvgOXZFCCMK1ExFRVd7CCFmILXIUoIj62A4kI+8zXiGTe7gdVsV\nxShFftfzkdCLFs1hT1tM4ew3k7MtSoPrlfniHN0CgYEAq0JqokjAvkaN7clehLDb\nr908XOyJoe3p3JWT/b7U1QdMUyta3EoElGLw9nfPHlxU/y+ljbXAV9C0/N67VOyW\nDJYyzUKj+s9ke8LqPtiSouJiwBvrs2FuGcS3IY5jeT4GvGEz49APUI28VciWswFo\narP6QrYB1B/3zjq84aO7hsk=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-en23i@stories-backend-system.iam.gserviceaccount.com",
      "client_id": "107169963984602236636",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-en23i%40stories-backend-system.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    });
    var scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
    var accessCredentials = await obtainAccessCredentialsViaServiceAccount(
        serviceAccountCredentials, scopes, http.Client());
    return accessCredentials.accessToken.data;
  }
}

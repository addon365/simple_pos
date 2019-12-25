String baseUrl = "https://addon365crm.azurewebsites.net/api";
bool isReleaseMode = true;
bool isLocal = true;
String dbName = "pos_db.db";

void setMode(bool bIsReleaseMode) {
  isReleaseMode = bIsReleaseMode;
  if (isReleaseMode) {
    baseUrl = "https://addon365crm.azurewebsites.net/api";
  } else {
    // baseUrl = "https://addon365crm.azurewebsites.net/api";
    baseUrl = "http://192.168.0.103:3000/api";
  }
}

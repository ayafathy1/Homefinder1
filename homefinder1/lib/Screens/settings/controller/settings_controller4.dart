import 'package:get/get.dart';

class SettingsController extends GetxController{
   int selectedIndex=7;
   List<String> photosUnSelected=["lib/assets/images/EditProfileSelected.png",
   "lib/assets/images/lockSettings.png",
   "lib/assets/images/notificationSettings.png",
   "lib/assets/images/chatSettings.png",
   "lib/assets/images/favoriteSettings.png",
   "lib/assets/images/logOutSettings.png",
   "lib/assets/images/deleteAccountSettings.png"];
   List<String> photosSelected=["lib/assets/images/editProfile.png"
   ,"lib/assets/images/SettingsLockSelected.png",
   "lib/assets/images/SettingsNotificationsSelected.png",
   "lib/assets/images/SettingsChatSelected.png",
   "lib/assets/images/SettingsFavoriteSelected.png",
   "lib/assets/images/SettingsLogOutSelected.png",
   "lib/assets/images/SettingsDeleteAccountSelected.png"];
   List<String> actions=["Edit Profile","Change Password",
      "Notifications","Chats","Favorites",
      "Log out","Delete account"];
}
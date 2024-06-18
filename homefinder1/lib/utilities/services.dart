

class Services {
 static String baseEndPoint = "https://home-finder-back-end-i7ca.onrender.com/api/v1/";
 static String resendVerificationEndPoint = "auth/resend-code"; //Post
 static String resendVerificationForgetEndPoint = "auth/resend-pass-otp/"; //Post
 static String verificationCodeEndPoint = "auth/verification";//post
 static String verificationCodeForgetEndPoint = "auth/verify-pass-otp/";//post
 static String addFavEndPoint = "user/favorites/add/"; //get
 static String deleteFavEndPoint = "user/favorites/delete/"; //delete
 static String deleteAllFavEndPoint = "user/favorites/delete"; //delete
 static String signingUpEndPoint = "auth/signup"; //Post
 static String completeSigningUpEndPoint = "auth/complete-signup";
 static String signingInEndPoint = "auth/login"; //Post
 static String signOutEndPoint = "auth/logout"; //get
 static String resetPasswordEndPoint = "auth/reset-pass/";//patch
 static String deleteAccountEndPoint = "user/delete-user";//delete
 static String uploadImageEndPoint = "user/upload-image";//post
 static String changePasswordEndPoint = "user/change-password";//patch
 static String getUserEndPoint = "user/get-user";//get
 static String updateUserEndPoint = "user/update-user";//patch
 static String deleteAccountPhotoEndPoint = "user/delete-profile-picture";//delete
 static String createResidence = "residence/create"; //Post
 static String forgetPasswordEndPoint = "auth/forgot-pass";//post
 static String firstCompleteEndPoint = "residence/complete/1st/";
 static String secondCompleteEndPoint = "residence/complete/2nd/";
 static String fourthCompleteEndPoint = "residence/complete/4th/";
 static String deleteOneResidenceEndPoint = "residence/delete/";//delete
 static String GetSoldForProfileEndPoint = "residence/sold?";//get
}

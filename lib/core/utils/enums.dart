enum Appearance {
  primary, secondary, clean, error, success, dark
}

enum AppButtonType {
  primary, secondary
}

enum Position {
  top, bottom
}


enum ImagePickerFileType {
  image, document
}


enum AnimateType {
  slideLeft, slideUp
}

enum VideoType {
  asset, network, file
}

enum PhotoVideoType {
  photo, video
}

enum IndexMenuOption {
  about, menu, faq, features, reviews, gallery
}

enum AccountMenuOption {
  plugins, favorite, myListings, profile, dashboard
}

enum SharedErrorType {
  empty, error
}

enum BlocStatus {
  initial,
  loginProgress, loginSuccessful, loginFailed, logOutSuccessful,logOutInProgress,

  //! Index Page
  fetchAnimalsInProgress, fetchAnimalsFailed, fetchAnimalsSuccessful,
  activateIndexMenuOptionInProgress, activateIndexMenuOptionCompleted,


  activateAccountMenuOptionInProgress, activateAccountMenuOptionCompleted,

  uploadingIDInProgress, uploadingIDSuccessful, uploadingIDFailed


}


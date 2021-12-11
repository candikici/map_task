// ignore_for_file: file_names

abstract class IPlaceService {
  Future findPlaces(String searchKey);
  String getPhotoURL(String photoReference);
}

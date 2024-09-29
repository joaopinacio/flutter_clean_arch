abstract class AppNotification {
  Future<void> optIn();
  Future<void> optOut();
  void addClickListener();
}

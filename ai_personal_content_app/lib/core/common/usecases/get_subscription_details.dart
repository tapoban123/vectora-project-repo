class GetSubscriptionDetails {
  GetSubscriptionDetails();

  Future call() async {
    /// Returns Either datatype with
    /// - left -> User is non-subscriber; Returns remaining user credits
    /// and other free model details
    /// - right -> User is subscriber; Returns user paid plan details
    /// like plan start date, expiry date, etc.
  }
}

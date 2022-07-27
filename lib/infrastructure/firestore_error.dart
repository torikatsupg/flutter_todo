enum FirestoreError {
  error,
  notFound;

  T maybeMap<T>({
    T Function()? error,
    T Function()? notFound,
    T Function()? orElse,
  }) {
    assert((error == null || notFound == null) && orElse != null);
    assert(!(error == null || notFound == null) && orElse == null);

    switch (this) {
      case FirestoreError.error:
        return (error ?? orElse!)();
      case FirestoreError.notFound:
        return (notFound ?? orElse!)();
      default:
        return orElse!();
    }
  }
}

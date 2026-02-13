# ============================================================
# Flutter Framework Rules
# ============================================================
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# ============================================================
# Debugging & Crash Reporting
# ============================================================
# Keep line numbers for stack traces
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile

# Keep annotations
-keepattributes *Annotation*

# Keep generic signatures for reflection
-keepattributes Signature

# ============================================================
# Native Methods
# ============================================================
-keepclasseswithmembernames class * {
    native <methods>;
}

# ============================================================
# Reflection & Serialization
# ============================================================
# Keep enum classes
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Keep Parcelable implementations
-keepclassmembers class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# Keep Serializable classes
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# ============================================================
# RAZORPAY SDK INTEGRATION
# ============================================================
-keepattributes *Annotation*
-dontwarn com.razorpay.**
-keep class com.razorpay.** {*;}
-optimizations !method/inlining/
-keepclasseswithmembers class * {
    public void onPayment*(...);
}

# ============================================================
# YOUR APP-SPECIFIC RULES
# ============================================================
# Replace 'com.example.yourapp' with your actual package name
-keep class com.tapobanray.vectora.** { *; }

# If you have data models that use JSON serialization
# -keep class com.tapobanray.vectora.models.** { *; }

# ============================================================
# Common Dependencies (Uncomment if used)
# ============================================================

# Gson (often used with payment SDKs for JSON)
# -keep class sun.misc.Unsafe { *; }
# -keep class com.google.gson.** { *; }
# -keep class * implements com.google.gson.TypeAdapter
# -keep class * implements com.google.gson.TypeAdapterFactory

# OkHttp (Razorpay may use this internally)
# -dontwarn okhttp3.**
# -dontwarn okio.**
# -keep class okhttp3.** { *; }
# -keep interface okhttp3.** { *; }

# ============================================================
# WebView (if Razorpay uses WebView for payments)
# ============================================================
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# ============================================================
# Notes:
# - Replace 'com.example.yourapp' with your package name
# - Test payment flow thoroughly in release mode
# - Check for any custom payment callbacks in your code
# ============================================================

# ============================================================
# Google Play Services Tasks API
# ============================================================
-keep class com.google.android.gms.tasks.** { *; }
-dontwarn com.google.android.gms.tasks.**

# Keep Play Core Tasks (alternative namespace)
-keep class com.google.android.play.core.tasks.** { *; }
-dontwarn com.google.android.play.core.tasks.**

# ============================================================
# Google Play Core Libraries
# ============================================================
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**
-keepclassmembers class com.google.android.play.core.** { *; }

# Keep split install classes
-keep class com.google.android.play.core.splitcompat.** { *; }
-keep class com.google.android.play.core.splitinstall.** { *; }
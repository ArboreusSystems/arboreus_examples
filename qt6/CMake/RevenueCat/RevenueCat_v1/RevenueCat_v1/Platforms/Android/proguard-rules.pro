# ==============================================================================
# 1. Qt 6 Android Core, Bindings & Native Loader Rules
# ==============================================================================
-keep class org.qtproject.** { *; }
-keep class org.qtproject.qt.android.** { *; }
-keep class org.qtproject.qt.android.bindings.** { *; }
-dontwarn org.qtproject.**

# Preserve all native C++ JNI method bindings across the application
-keepclasseswithmembernames,includedescriptorclasses class * {
	native <methods>;
}

# ==============================================================================
# 2. Android Resources (Fixes Invalid resource ID 0x00000000)
# ==============================================================================
# QtLoader looks up array and string resources (bundled_libs, qt_libs, etc.)
# dynamically by name at runtime. Keep all generated R classes and fields intact.
-keepclassmembers class **.R$* {
	public static <fields>;
}
-keep class **.R$*

# ==============================================================================
# 3. Custom Application Package Rules (systems.arboreus.ARevenueNative)
# ==============================================================================
# Keep all classes, constructors, methods, and fields in your custom package
# so QJniObject calls from C++ never fail at runtime.
-keep class systems.arboreus.ARevenueNative.** { *; }
-keepclassmembers class systems.arboreus.ARevenueNative.** { *; }

# ==============================================================================
# 4. RevenueCat framework
# ==============================================================================
# RevenueCat & Google Play Billing Rules
-keep class com.revenuecat.purchases.** { *; }
-dontwarn com.revenuecat.purchases.**
-keep class com.android.billingclient.** { *; }
-dontwarn com.android.billingclient.**

# ==============================================================================
# 5. General Java, Reflection & JNI Safety Rules
# ==============================================================================
-keepattributes *Annotation*,Signature,InnerClasses,EnclosingMethod,Exceptions

# Keep custom View constructors if any Android XML layouts are used
-keepclasseswithmembers class * {
	public <init>(android.content.Context, android.util.AttributeSet);
}
-keepclasseswithmembers class * {
	public <init>(android.content.Context, android.util.AttributeSet, int);
}

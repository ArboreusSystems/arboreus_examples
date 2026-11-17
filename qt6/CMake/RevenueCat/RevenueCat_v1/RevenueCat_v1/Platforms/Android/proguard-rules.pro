# ==============================================================================
# 1. Qt 6 Android Core & Native Loader Rules
# ==============================================================================
-keep class org.qtproject.** { *; }
-dontwarn org.qtproject.**

# Preserve all native C++ JNI method bindings across the application
-keepclasseswithmembernames,includedescriptorclasses class * {
    native <methods>;
}

# ==============================================================================
# 2. Custom Application Package Rules (systems.arboreus.ARevenueNative)
# ==============================================================================
# Keep all classes, constructors, methods, and fields in your custom package
# so QJniObject / QAndroidJniObject calls from C++ never fail at runtime.
-keep class systems.arboreus.ARevenueNative.** { *; }
-keepclassmembers class systems.arboreus.ARevenueNative.** { *; }

# ==============================================================================
# 3. AndroidX & Fragment Rules (Matches androidx.fragment:1.8.9)
# ==============================================================================
-keep class * extends androidx.fragment.app.Fragment {
    public <init>();
}
-keep class * extends androidx.activity.ComponentActivity {
    public <init>();
}
-dontwarn androidx.**

# ==============================================================================
# 4. General Java & JNI Safety Rules
# ==============================================================================
-keepattributes *Annotation*,Signature,InnerClasses,EnclosingMethod,Exceptions

# Keep custom View constructors if any Android XML layouts are used
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

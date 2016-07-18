diff -Naur desmume-0.9.11.orig/src/ctrlssdl.cpp desmume-0.9.11/src/ctrlssdl.cpp
--- desmume-0.9.11.orig/src/ctrlssdl.cpp	2015-02-14 23:05:26.000000000 +0800
+++ desmume-0.9.11/src/ctrlssdl.cpp	2016-07-18 16:02:16.941860279 +0800
@@ -26,6 +26,8 @@
 #include "mic.h"
 #endif
 
+#define abs(a) ((a) > 0 ? (a) : (-(a)))
+
 u16 keyboard_cfg[NB_KEYS];
 u16 joypad_cfg[NB_KEYS];
 u16 nbr_joy;
diff -Naur desmume-0.9.11.orig/src/wifi.cpp desmume-0.9.11/src/wifi.cpp
--- desmume-0.9.11.orig/src/wifi.cpp	2015-02-14 23:05:26.000000000 +0800
+++ desmume-0.9.11/src/wifi.cpp	2016-07-18 16:02:41.830079747 +0800
@@ -314,9 +314,9 @@
 
 #if (WIFI_LOGGING_LEVEL >= 1)
 	#if WIFI_LOG_USE_LOGC
-		#define WIFI_LOG(level, ...) if(level <= WIFI_LOGGING_LEVEL) LOGC(8, "WIFI: "__VA_ARGS__);
+		#define WIFI_LOG(level, ...) if(level <= WIFI_LOGGING_LEVEL) LOGC(8, "WIFI: " __VA_ARGS__);
 	#else
-		#define WIFI_LOG(level, ...) if(level <= WIFI_LOGGING_LEVEL) printf("WIFI: "__VA_ARGS__);
+		#define WIFI_LOG(level, ...) if(level <= WIFI_LOGGING_LEVEL) printf("WIFI: " __VA_ARGS__);
 	#endif
 #else
 #define WIFI_LOG(level, ...) {}

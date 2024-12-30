#!/bin/bash

clear
sh inc.sh
flutter clean && flutter build ipa
# ios/Pods/FirebaseCrashlytics/upload-symbols -gsp ios/GoogleService-Info.plist -p ios build/ios/archive/Runner.xcarchive/dSYMs

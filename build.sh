#!/usr/bin/env bash
# Gera app/build/outputs/bundle/release/app-release.aab
# Requer: JDK 17+, Gradle 8.9+ e Android SDK (ANDROID_HOME) — ou apenas instale o Android Studio.
set -e
cd "$(dirname "$0")"
if [ ! -f keystore.properties ]; then
  echo "Criando keystore de upload (GUARDE keystore.jks e a senha — necessários p/ atualizações na Play Store)"
  keytool -genkeypair -v -keystore keystore.jks -alias upload -keyalg RSA -keysize 2048 -validity 10000 \
    -storepass stackattack123 -keypass stackattack123 -dname "CN=Stack Attack, O=Stack Attack, C=BR"
  printf 'storeFile=keystore.jks\nstorePassword=stackattack123\nkeyAlias=upload\nkeyPassword=stackattack123\n' > keystore.properties
fi
if [ -x ./gradlew ]; then ./gradlew bundleRelease; else gradle bundleRelease; fi  # precisa Gradle 8.9+ se não houver gradlew
echo "AAB: $(pwd)/app/build/outputs/bundle/release/app-release.aab"

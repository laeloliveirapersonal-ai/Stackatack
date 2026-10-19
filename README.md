# Stack Attack — projeto Android (AAB)
Opção 1 (local): instale JDK 17 + Gradle 8.9+ + Android SDK (ou use Android Studio: abra a pasta e Build > Generate Signed Bundle) e rode `./build.sh`.
Opção 2 (sem instalar nada): suba esta pasta num repositório GitHub; a aba Actions > "Build AAB" gera o .aab para download.
Saída: app/build/outputs/bundle/release/app-release.aab
Para a Play Store, troque o keystore por um seu (keystore.properties) e guarde-o.

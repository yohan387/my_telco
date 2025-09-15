# 📱 Mini Projet Flutter – Recrutement Orange CI

## 🚀 Requirements
Avant de démarrer, assurez-vous d’avoir installé les outils suivants :

- Flutter **3.29.1 ou supérieur**
- Dart **3.7.0 ou supérieur**
- Java **17 ou supérieur**
- Android Studio ou VS Code avec les extensions Flutter & Dart
- Un émulateur Android ou un appareil physique connecté

---

## ⚙️ Installation

### ✅ Cas 1 : Vous avez déjà Flutter 3.29.1+, Dart 3.7.0+ et Java 17+
1. **Cloner le projet**
   ```bash
   git clone https://github.com/<username>/<repo>.git
   cd <repo>
   ```
2. **Installer les dépendances**
   ```bash
   flutter pub get
   ```
3. **Vérifier l’environnement**
   ```bash
   flutter doctor
   ```

### ⚡ Cas 2 : Vous n’avez pas la bonne version (via FVM)
1. **Installer FVM (Flutter Version Management)**
   ```bash
   dart pub global activate fvm
   ```
2. **Ajouter FVM à votre `PATH`**

- **Windows** :  
  Localisez le dossier FVM, généralement `C:\Users\<VotreUser>\fvm`, puis ouvrez le dossier `cache\bin`. Exemple complet :
  ```
  C:\Users\<VotreUser>\fvm\cache\bin
  ```  
  Ajoutez-le dans vos **Variables d’environnement → Path** ou utilisez PowerShell en mode admin :
  ```powershell
  setx PATH "$Env:PATH;C:\Users\<VotreUser>\fvm\cache\bin"
  ```

- **Linux / macOS** :  
  Ajoutez dans votre fichier de configuration du shell (`~/.bashrc`, `~/.zshrc`, etc.) :
  ```bash
  export PATH="$PATH:$HOME/fvm/default/bin"
  ```
  Puis rechargez le shell :
  ```bash
  source ~/.bashrc   # ou source ~/.zshrc selon le shell
  ```

> Sur macOS, le dossier `~/.pub-cache/bin` peut aussi être utilisé si FVM est installé via `dart pub global activate fvm`.

3. **Installer la version requise pour le projet**
   ```bash
   fvm install 3.29.1
   ```
4. **Utiliser FVM pour ce projet**
   ```bash
   fvm use 3.29.1
   ```
5. **Installer les dépendances avec FVM**
   ```bash
   fvm flutter pub get
   ```
6. **Vérifier l’environnement**
   ```bash
   fvm flutter doctor
   ```

---

## ▶️ Lancer le projet

- **Sur un émulateur ou appareil connecté**
  ```bash
  flutter run
  ```
  ou avec FVM :
  ```bash
  fvm flutter run
  ```

- **Générer un APK (Android)**
  ```bash
  flutter build apk --release
  ```
  ou :
  ```bash
  fvm flutter build apk --release
  ```

- **Générer un App Bundle (AAB) pour Play Store**
  ```bash
  flutter build appbundle --release
  ```
  ou :
  ```bash
  fvm flutter build appbundle --release
  ```

---

## 🔧 Configuration FVM recommandée
Afin d’éviter les conflits de version entre les contributeurs, ajoutez le fichier `.fvm/fvm_config.json` au projet :

```json
{
  "flutterSdkVersion": "3.29.1",
  "flavors": {}
}
```

Cela permet à FVM de verrouiller la version Flutter utilisée pour ce projet.

---

## 📝 Notes
- Le projet utilise **Java 17+**, assurez-vous que votre IDE et Gradle pointent bien vers cette version.  
- Si vous n’avez pas Flutter 3.29.1 et Dart 3.7.0, utilisez **FVM** pour éviter tout conflit avec d’autres projets.  
- L’utilisation de FVM est fortement conseillée si vous travaillez sur plusieurs projets Flutter.

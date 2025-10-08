echo "Cleaning up macOS environment"

echo "[CLEANUP] Removing Gradle cache"
rm -rf ~/.gradle/caches/

echo "[CLEANUP] Removing Global and Local Yarn cache"
yarn cache clean --all

echo "[CLEANUP] Removing CocoaPods cache"
rm -rf ~/Library/Caches/CocoaPods/

echo "[CLEANUP] Removing unnecessary Homebrew files"
brew cleanup --prune=all

echo "[CLEANUP] Removing old XCode builds"
rm -rf ~/Library/Developer/Xcode/DerivedData && mkdir ~/Library/Developer/Xcode/DerivedData

# Simple script to automatically copy the templates to the right xcode folder
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -R $DIR/MVVM.xctemplate ~/Library/Developer/Xcode/Templates/File\ Templates/

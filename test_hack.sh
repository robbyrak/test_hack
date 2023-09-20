# Replace with the extension URL and destination path
extension_url="https://chrome.google.com/webstore/detail/ts-chrome-extension/pjdijmmigngcbklljkmjgibllamngpfn"
download_path="/path/to/save/extension.crx"

extension_id=$(basename "$extension_url")
curl -L -o "$download_path" "https://clients2.google.com/service/update2/crx?response=redirect&os=mac&arch=x86-64&nacl_arch=x86-64&prod=chromiumcrx&prodchannel=unknown&prodversion=9999.0.0.0&x=id%3D$extension_id%26uc"
chrome-cli install "$download_path"

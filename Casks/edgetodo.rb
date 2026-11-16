# Template for Casks/edgetodo.rb in dcvonb/homebrew-tap. scripts/release.sh rewrites `version`, `sha256` and `url`
# there at each release (and copies this file when the tap has none yet). Issue #23.
cask "edgetodo" do
  version "2026.11.0"
  sha256 "ce707172118b41b7802822e6e67446e8477b62e1f87079772cf686f92493371c"

  # The tap's own releases while dcvonb/EdgeTodo is private, that repo's once it is public.
  url "https://github.com/dcvonb/homebrew-tap/releases/download/v#{version}/EdgeTodo-#{version}.dmg"
  name "EdgeTodo"
  desc "Todo panel that slides in from a screen edge, with GitHub issue sync"
  homepage "https://modest-apps.com/" # placeholder until the product page exists (#24)

  depends_on macos: :sonoma

  app "EdgeTodo.app"

  # A menu-bar app: running it would otherwise block removal.
  uninstall quit: "com.modest-apps.EdgeTodo"

  # The GitHub token lives in the login Keychain (service com.modest-apps.EdgeTodo.github); zap can't remove it,
  # delete that item in Keychain Access.
  zap trash: [
    "~/Library/Application Support/EdgeTodo",
    "~/Library/Caches/com.modest-apps.EdgeTodo",
    "~/Library/Preferences/com.modest-apps.EdgeTodo.plist",
  ]
end

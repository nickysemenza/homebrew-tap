cask "overboard" do
  version "0.3.0"
  # `version` and `sha256` are bumped by the Release workflow in
  # https://github.com/nickysemenza/overboard after each release's zip is
  # uploaded; don't edit them by hand.
  sha256 "03bcc6f6a05e6c3141bd7ed22a0f64315b92df23c2d0c4c18657f7090cc38159"

  url "https://github.com/nickysemenza/overboard/releases/download/v#{version}/Overboard-#{version}.zip"
  name "Overboard"
  desc "Menu-bar launcher and clipboard manager"
  homepage "https://github.com/nickysemenza/overboard"

  livecheck do
    url :url
    strategy :github_latest
  end

  # :tahoe is macOS 26, the oldest release Overboard builds against.
  depends_on macos: :sonoma

  app "Overboard.app"

  zap trash: [
    "~/Library/Application Support/Overboard",
    "~/Library/Caches/com.nickysemenza.overboard",
    "~/Library/HTTPStorages/com.nickysemenza.overboard",
    "~/Library/Preferences/com.nickysemenza.overboard.plist",
    "~/Library/Saved Application State/com.nickysemenza.overboard.savedState",
  ]
end

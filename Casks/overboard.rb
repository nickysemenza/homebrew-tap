cask "overboard" do
  version "0.4.0"
  # `version` and `sha256` are bumped by the Release workflow in
  # https://github.com/nickysemenza/overboard after each release's zip is
  # uploaded; don't edit them by hand.
  sha256 "9640b7e2fdd05ee3fd0af2360f963564a317eaf742d5a06eebf1f8bc782f4a43"

  url "https://github.com/nickysemenza/overboard/releases/download/v#{version}/Overboard-#{version}.zip"
  name "Overboard"
  desc "Menu-bar launcher and clipboard manager"
  homepage "https://github.com/nickysemenza/overboard"

  livecheck do
    url :url
    strategy :github_latest
  end

  # :tahoe is macOS 26, the oldest release Overboard builds against.
  depends_on macos: :tahoe

  app "Overboard.app"

  zap trash: [
    "~/Library/Application Support/Overboard",
    "~/Library/Caches/com.nickysemenza.overboard",
    "~/Library/HTTPStorages/com.nickysemenza.overboard",
    "~/Library/Preferences/com.nickysemenza.overboard.plist",
    "~/Library/Saved Application State/com.nickysemenza.overboard.savedState",
  ]
end

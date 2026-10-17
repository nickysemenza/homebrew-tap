cask "overboard" do
  version "0.10.1-20-g61f883c"
  # `version` and `sha256` are bumped by CI in
  # https://github.com/nickysemenza/overboard after every merge to main
  # (versions like 0.10.1-13-gabc1234) and every tagged release; don't edit
  # them by hand.
  sha256 "bba5513334b8ba726e086d29115d42f3af642709597f3a25790cd633ee66540b"

  url "https://github.com/nickysemenza/overboard/releases/download/v#{version}/Overboard-#{version}.zip"
  name "Overboard"
  desc "Menu-bar launcher and clipboard manager"
  homepage "https://github.com/nickysemenza/overboard"

  # Per-merge builds are published with --latest=false, so :github_latest
  # would report the last tagged release and `brew audit --online` (run by
  # bump.yml) would fail on the mismatch.
  livecheck do
    skip "Bumped by nickysemenza/overboard CI on every merge"
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

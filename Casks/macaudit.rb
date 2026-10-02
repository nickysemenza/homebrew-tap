cask "macaudit" do
  version "0.1.3"
  # `version` and `sha256` are bumped by the Release workflow in
  # https://github.com/nickysemenza/macaudit after each release's zip is
  # uploaded; don't edit them by hand.
  sha256 "8c3a2aeb61b533c69b63b233303da0b6d4fe670961014d844ebdf87a006676f2"

  url "https://github.com/nickysemenza/macaudit/releases/download/v#{version}/MacAudit-#{version}.zip"
  name "MacAudit"
  desc "Audit of apps, disk hogs, daemons and dev-tool sprawl (TUI + menu-bar app)"
  homepage "https://github.com/nickysemenza/macaudit"

  livecheck do
    url :url
    strategy :github_latest
  end

  # arm64 is the only slice built; macOS 14 is the app's deployment target.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  # The release zip holds both side by side (scripts/package.sh in the repo).
  app "MacAudit.app"
  binary "macaudit"

  zap trash: [
    "~/.config/macaudit",
    "~/.local/state/macaudit",
    "~/Library/Caches/macaudit",
    "~/Library/HTTPStorages/dev.nickysemenza.macaudit",
    "~/Library/Preferences/dev.nickysemenza.macaudit.plist",
    "~/Library/Saved Application State/dev.nickysemenza.macaudit.savedState",
  ]
end

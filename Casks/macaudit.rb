cask "macaudit" do
  version "0.1.0"
  # `version` and `sha256` are bumped by the Release workflow in
  # https://github.com/nickysemenza/macaudit after each release's zip is
  # uploaded; don't edit them by hand.
  sha256 "c9c850e1a809d80b5fdb552f080ddae0bb84a602ee9a66837121303f3ed5b9e6"

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

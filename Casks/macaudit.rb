cask "macaudit" do
  version "0.1.3-47-ged22553"
  # `version` and `sha256` are bumped by CI in
  # https://github.com/nickysemenza/macaudit after every merge to main
  # (versions like 0.1.3-5-gabc1234) and every tagged release; don't edit
  # them by hand.
  sha256 "f75d21e39f0a2d7f1cad08928b3c6195f0283942d30f038240087464b8652ce0"

  url "https://github.com/nickysemenza/macaudit/releases/download/v#{version}/MacAudit-#{version}.zip"
  name "MacAudit"
  desc "Audit of apps, disk hogs, daemons and dev-tool sprawl (TUI + menu-bar app)"
  homepage "https://github.com/nickysemenza/macaudit"

  # Per-merge builds are published with --latest=false, so :github_latest
  # would report the last tagged release and `brew audit --online` (run by
  # bump.yml) would fail on the mismatch.
  livecheck do
    skip "Bumped by nickysemenza/macaudit CI on every merge"
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

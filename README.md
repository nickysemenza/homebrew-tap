# nickysemenza/tap

Homebrew tap for [Overboard](https://github.com/nickysemenza/overboard), a
menu-bar launcher and clipboard manager for macOS 26+.

```sh
brew install --cask nickysemenza/tap/overboard
```

The cask downloads the signed and notarized zip from Overboard's GitHub
Releases. New releases bump `Casks/overboard.rb` here automatically (the
Release workflow in the app repo commits the version and checksum), so
`brew upgrade` picks them up.

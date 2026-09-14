# nickysemenza/tap

Homebrew tap for:

- [Overboard](https://github.com/nickysemenza/overboard), a menu-bar
  launcher and clipboard manager for macOS 26+:

  ```sh
  brew install --cask nickysemenza/tap/overboard
  ```

- [MacAudit](https://github.com/nickysemenza/macaudit), a "why is my Mac
  like this" audit for macOS 14+ on Apple Silicon — one cask installs both
  the `macaudit` CLI and MacAudit.app:

  ```sh
  brew install --cask nickysemenza/tap/macaudit
  ```

Each cask downloads the signed and notarized zip from the project's GitHub
Releases. New releases bump the cask here automatically (the Release
workflow in the app repo dispatches `bump.yml`, which commits the version
and checksum), so `brew upgrade` picks them up.

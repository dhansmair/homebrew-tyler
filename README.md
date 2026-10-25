# homebrew-tyler

The Homebrew tap for [tyler](https://github.com/dhansmair/tyler), a tiling window manager for macOS.

```sh
brew install --HEAD dhansmair/tyler/tyler
tyler start
```

There is no release with the app bundle yet, so the formula builds `main` (`--HEAD`). It needs the
Xcode Command Line Tools with Swift 6 (`xcode-select --install`).

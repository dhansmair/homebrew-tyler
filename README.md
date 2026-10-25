# homebrew-tyler

The Homebrew tap for [tyler](https://github.com/dhansmair/tyler), a tiling window manager for macOS.

```sh
brew install dhansmair/tyler/tyler
tyler start
```

`tyler` is the latest release. `tyler@<version>` stays at one release
(`brew install dhansmair/tyler/tyler@0.2.0`); it is keg-only, so `brew link --force tyler@0.2.0` puts
it on the `PATH`, after `brew unlink tyler` if that is installed. `--HEAD` builds `main`.

The formulae build from source and need the Xcode Command Line Tools with Swift 6
(`xcode-select --install`). tyler's release workflow updates them for every release.

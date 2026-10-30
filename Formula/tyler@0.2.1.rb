class TylerAT021 < Formula
  desc "Tiling window manager for macOS with workspaces side by side"
  homepage "https://github.com/dhansmair/tyler"
  url "https://github.com/dhansmair/tyler/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "7aa438dbd012d5e91b7033c071f9ccb519a8f141d2174c00ad01abce6b7e073e"
  license "MIT"

  keg_only :versioned_formula

  depends_on macos: :sonoma

  def install
    # SwiftPM's own sandbox can't start inside Homebrew's.
    %w[tyler tylerd].each do |product|
      system "swift", "build", "--disable-sandbox", "-c", "release", "--product", product
    end
    bin_path = Utils.safe_popen_read("swift", "build", "-c", "release", "--show-bin-path").chomp
    system "devtools/make-app", bin_path, "io.github.dhansmair.tyler", "Tyler", "-", "installed"

    # `tyler` finds Tyler.app next to its own binary, after resolving the symlink in bin.
    libexec.install "#{bin_path}/tyler", "#{bin_path}/tylerd", "#{bin_path}/Tyler.app"
    bin.install_symlink libexec/"tyler"
  end

  def caveats
    <<~EOS
      Start tyler with:
        tyler start
      It copies Tyler.app into ~/Applications and asks for the Accessibility permission
      (System Settings > Privacy & Security > Accessibility).

      After `brew upgrade tyler`, run `tyler restart`. Each build is signed ad hoc, which
      macOS treats as a new app, so it asks for the permission again.

      Before `brew uninstall tyler`, run `tyler stop`, then remove ~/Applications/Tyler.app
      and its permission:
        tccutil reset Accessibility io.github.dhansmair.tyler
    EOS
  end

  test do
    assert_match(/^tyler \d/, shell_output("#{bin}/tyler --version"))
    assert_path_exists libexec/"Tyler.app/Contents/MacOS/tylerd"
  end
end

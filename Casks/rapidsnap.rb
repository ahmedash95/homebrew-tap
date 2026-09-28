cask "rapidsnap" do
  version "2.0.0"
  sha256 "1486e0bbefea144e3b97508f563f6f8ddd84551e63f1f838bea5367a51821ebf"

  url "https://github.com/ahmedash95/rapidsnap/releases/download/v#{version}/RapidSnap-#{version}.dmg"
  name "RapidSnap"
  desc "Screenshot tool for macOS"
  homepage "https://github.com/ahmedash95/rapidsnap"

  depends_on arch: :arm64

  app "RapidSnap.app"

  # RapidSnap is ad-hoc signed but not notarized (no Apple Developer Program
  # membership), so Gatekeeper would refuse to launch the downloaded bundle.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/RapidSnap.app"],
                   must_succeed: false
  end

  uninstall quit: "io.github.ahmedash95.rapidsnap"
end

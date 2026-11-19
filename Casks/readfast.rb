cask "readfast" do
  version "0.1.5"
  sha256 "7b70afa56e189307bf1ed04765a12c90b6475a0b36b06ca9669cb1a24acd70b2"

  url "https://github.com/ahmedash95/readfast/releases/download/v#{version}/ReadFast-#{version}.dmg"
  name "ReadFast"
  desc "Fast CSV viewer for macOS"
  homepage "https://github.com/ahmedash95/readfast"

  depends_on arch: :arm64
  depends_on macos: ">= :golden_gate"

  app "ReadFast.app"

  # Ad-hoc signed but not notarized, so strip quarantine or Gatekeeper refuses it.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/ReadFast.app"],
                   must_succeed: false
  end

  uninstall quit: "dev.ahmedash.readfast"
end

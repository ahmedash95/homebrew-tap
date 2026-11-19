cask "readfast" do
  version "0.1.3"
  sha256 "7cef1e53512d9a42d5963500a02bb022e6f93cce81c77ef5b5b9b623d46077c7"

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

cask "readfast" do
  version "0.1.0"
  sha256 "d6fe4d422032621ac84763fcdce0251e517a157ecd5a93b9a359cf2ab6d365eb"

  url "https://github.com/ahmedash95/ReadFast/releases/download/v#{version}/ReadFast-#{version}.dmg"
  name "ReadFast"
  desc "Fast CSV viewer for macOS"
  homepage "https://github.com/ahmedash95/ReadFast"

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

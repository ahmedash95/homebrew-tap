cask "readfast" do
  version "0.1.6"
  sha256 "c01eca3cf4a8fb43e18f85f2a68f685ab6a399ef452f2c23bcfb2aad487a4f9c"

  url "https://github.com/ahmedash95/readfast/releases/download/v#{version}/ReadFast-#{version}.dmg"
  name "ReadFast"
  desc "Fast CSV viewer for macOS"
  homepage "https://github.com/ahmedash95/readfast"

  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  app "ReadFast.app"

  # Ad-hoc signed but not notarized, so strip quarantine or Gatekeeper refuses it.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/ReadFast.app"],
                   must_succeed: false
  end

  uninstall quit: "dev.ahmedash.readfast"
end

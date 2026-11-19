cask "readfast" do
  version "0.1.7"
  sha256 "60f5e266957a7e42b8c368aa1843bcb62ea082d7a6b9288359497c386d4bd66b"

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

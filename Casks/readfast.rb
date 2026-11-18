cask "readfast" do
  version "0.1.1"
  sha256 "e00395cffad14ab1bc2fe5fc89edb5cd00abe8158c4aa19cd86c66938b274800"

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

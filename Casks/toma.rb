cask "toma" do
  version "0.2.0"
  sha256 "7aa3b493840cf2533f72369373b0680eef8a1c40290f616608545aabca48f10d"

  url "https://github.com/ahmedash95/toma/releases/download/v#{version}/Toma-#{version}.dmg"
  name "Toma"
  desc "Native macOS workspace for coordinating coding agents"
  homepage "https://github.com/ahmedash95/toma"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Toma.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/Toma.app"],
                   must_succeed: false
  end

  uninstall quit: "dev.toma.app"
end

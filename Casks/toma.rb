cask "toma" do
  version "0.1.0"
  sha256 "f897b288c7a2aadfc5a07ced0030762c7549eca4ef02962f8eca40fa9a063c05"

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

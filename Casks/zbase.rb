cask "zbase" do
  version "0.1.0"
  sha256 ""

  url "https://github.com/cameroncooper/zbase/releases/download/v#{version}/zBase-#{version}-macos-arm64.zip"
  name "zBase"
  desc "A fast, native chat client"
  homepage "https://github.com/cameroncooper/zbase"

  depends_on macos: ">= :ventura"

  app "zBase.app"

  zap trash: [
    "~/.zbase",
  ]
end


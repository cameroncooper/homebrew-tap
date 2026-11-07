class Zbase < Formula
  desc "A fast, native chat client"
  homepage "https://github.com/cameroncooper/zbase"
  url "https://github.com/cameroncooper/zbase/archive/refs/tags/v1.0.16.tar.gz"
  sha256 "502c6280ec5082b4d9f18ca591006589d6da9dfd813bf74b57808aa57e522747"
  license "MIT"

  depends_on "rust" => :build
  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on macos: :sequoia
  depends_on "ffmpeg"

  def install
    system "scripts/macos/build_app_bundle.sh", "release"
    prefix.install "dist/macos/zBase.app"
    bin.install_symlink prefix/"zBase.app/Contents/MacOS/zbase"
  end

  def caveats
    <<~EOS
      The zBase.app bundle is at #{prefix}/zBase.app.
      Official signed and notarized DMGs are available on GitHub Releases.
    EOS
  end

  test do
    assert_predicate bin/"zbase", :executable?
  end
end

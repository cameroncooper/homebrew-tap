class Zbase < Formula
  desc "A fast, native chat client"
  homepage "https://github.com/cameroncooper/zbase"
  url "https://github.com/cameroncooper/zbase/archive/refs/tags/v1.0.20.tar.gz"
  sha256 "ccfe140df9680d3e11a60dbf32b1324a1aa6e1962f06e73e5b222752cecf2b38"
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

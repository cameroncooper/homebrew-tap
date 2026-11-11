class Zbase < Formula
  desc "A fast, native chat client"
  homepage "https://github.com/cameroncooper/zbase"
  url "https://github.com/cameroncooper/zbase/archive/refs/tags/v1.0.23.tar.gz"
  sha256 "986c56d4157b7b85491b89ce2fe14e4fc3fb497dbafd2dfbc386b290b7c9859e"
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

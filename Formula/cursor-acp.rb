class CursorAcp < Formula
  desc "ACP proxy for Cursor CLI"
  homepage "https://github.com/cameroncooper/cursor-acp"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.7/cursor-acp-1.0.7-aarch64-apple-darwin.tar.gz"
      sha256 "da6ce73d82c97ac2fd1a5edc4873854bd263a9cdf925e8cc018e30488a48adc3"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.7/cursor-acp-1.0.7-x86_64-apple-darwin.tar.gz"
      sha256 "89401832509a78d16d83f3d4fd0e7c9865041dc81fa8ad75056af91bc8d36d14"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.7/cursor-acp-1.0.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "20803038087ce0aba595487cb9dcfacc4879283b4d462c648e3691994a61231e"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.7/cursor-acp-1.0.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f10dad19016785ce01fead8758038d474eae0fd533c586a54e231e08a426fea4"
    end
  end

  def install
    bin.install "cursor-acp"
  end

  test do
    assert_match "cursor-acp", shell_output("#{bin}/cursor-acp --help")
  end
end

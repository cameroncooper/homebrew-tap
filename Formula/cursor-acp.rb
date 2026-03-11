class CursorAcp < Formula
  desc "ACP proxy for Cursor CLI"
  homepage "https://github.com/cameroncooper/cursor-acp"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.5/cursor-acp-1.0.5-aarch64-apple-darwin.tar.gz"
      sha256 "9b0542d0ba89b833972ccf064755b8d858cc4f2d979d3f1f0959345f7e4657dc"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.5/cursor-acp-1.0.5-x86_64-apple-darwin.tar.gz"
      sha256 "b6dc3362ff6940079c5292c00b1b975d28cde9e85a812728de289463132948ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.5/cursor-acp-1.0.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59ea6b053e838bd0928c24f58228d463a66dc1645fce6a43f15c234b4e082d27"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.5/cursor-acp-1.0.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7c6a7e21ac78d1c2c3c43ffb8a2983e5170b493b3dbf992e1ce0935d5c2ba3c"
    end
  end

  def install
    bin.install "cursor-acp"
  end

  test do
    assert_match "cursor-acp", shell_output("#{bin}/cursor-acp --help")
  end
end

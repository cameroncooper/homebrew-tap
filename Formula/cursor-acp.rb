class CursorAcp < Formula
  desc "ACP proxy for Cursor CLI"
  homepage "https://github.com/cameroncooper/cursor-acp"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.9/cursor-acp-1.0.9-aarch64-apple-darwin.tar.gz"
      sha256 "ba18c3a73cfc69b287361baf95d78e568e6c657367bd9352a16f66d3f8a50fb5"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.9/cursor-acp-1.0.9-x86_64-apple-darwin.tar.gz"
      sha256 "e80918d233c43b55c42da478c0d41174a6aefc3e13eab6ad3a16d01e7291cb56"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.9/cursor-acp-1.0.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2265736e129b8bb1fafc0348bc60750b30d7a568d44f7802f90d5dee7f6fb69e"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.9/cursor-acp-1.0.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5910b51070c4900e86115a5a1abd1812a54273ed1fbb28a713d3723baaa70eb7"
    end
  end

  def install
    bin.install "cursor-acp"
  end

  test do
    assert_match "cursor-acp", shell_output("#{bin}/cursor-acp --help")
  end
end

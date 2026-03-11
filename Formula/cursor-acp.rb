class CursorAcp < Formula
  desc "ACP proxy for Cursor CLI"
  homepage "https://github.com/cameroncooper/cursor-acp"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.6/cursor-acp-1.0.6-aarch64-apple-darwin.tar.gz"
      sha256 "7a5c6a0796cb69d4dc1fe6314be717322fae91eaee45a1a41762bcddf44b3e32"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.6/cursor-acp-1.0.6-x86_64-apple-darwin.tar.gz"
      sha256 "462f152b711c4c5b61e3b5b95116d3bfed65a672c05781a250f537dc5b6e7ecb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.6/cursor-acp-1.0.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "051c7fe411c2501d6bf8a5c89de0e708d154c585bd144dce9a1c7354bd5f922b"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.6/cursor-acp-1.0.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a9ae4b3de36697533867df7e9e1b4e91dc3f831d092506ac95b2ae43b6a1201"
    end
  end

  def install
    bin.install "cursor-acp"
  end

  test do
    assert_match "cursor-acp", shell_output("#{bin}/cursor-acp --help")
  end
end

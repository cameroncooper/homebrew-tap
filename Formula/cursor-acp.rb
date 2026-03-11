class CursorAcp < Formula
  desc "ACP proxy for Cursor CLI"
  homepage "https://github.com/cameroncooper/cursor-acp"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.4/cursor-acp-1.0.4-aarch64-apple-darwin.tar.gz"
      sha256 "000b3de0f5402522205d1a7c3e49008978ab9f078f9cea43eb3e62f8c45cf759"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.4/cursor-acp-1.0.4-x86_64-apple-darwin.tar.gz"
      sha256 "1b81936d0eb2102b9834d32f6f5c01a4c1666a979379bfe9b4e7c793ece4bcd9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.4/cursor-acp-1.0.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c8cdb988bea707694416da020ee22d4adacccb5a9f4f600b142acf42b9cde45"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.4/cursor-acp-1.0.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "33e36489434dda4af6323544311b689fdd802ce1160906731e782be5593497cc"
    end
  end

  def install
    bin.install "cursor-acp"
  end

  test do
    assert_match "cursor-acp", shell_output("#{bin}/cursor-acp --help")
  end
end

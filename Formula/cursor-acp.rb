class CursorAcp < Formula
  desc "ACP proxy for Cursor CLI"
  homepage "https://github.com/cameroncooper/cursor-acp"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.2/cursor-acp-1.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "b688c6da00bf23ad2763c200a64e74bf801cfd2338fa8ed10eb320d1fb358822"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.2/cursor-acp-1.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "dcacaee1033e2c8a7a8f9ebcd383f2f00a1d5753bdf869543aa3da9306f86f0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.2/cursor-acp-1.0.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b5c53cfc803f99c51d6df66262466eac235b143d238edd7cd6ad6dbd88a672a"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.2/cursor-acp-1.0.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d1305fe1d74dcb1c7c0bc43a0e8393ccf95ea9e3e42924d6c21c886cb15f9a2d"
    end
  end

  def install
    bin.install "cursor-acp"
  end

  test do
    assert_match "cursor-acp", shell_output("#{bin}/cursor-acp --help")
  end
end

class CursorAcp < Formula
  desc "ACP proxy for Cursor CLI"
  homepage "https://github.com/cameroncooper/cursor-acp"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.3/cursor-acp-1.0.3-aarch64-apple-darwin.tar.gz"
      sha256 "117b025078c15452f507932f0320392eae74399ca446e5abc208c532712f05b4"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.3/cursor-acp-1.0.3-x86_64-apple-darwin.tar.gz"
      sha256 "730ceaf2d357b9432df56f44adb16d5db27e1448f25fcb73e2648c9c49cf4524"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.3/cursor-acp-1.0.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ccdc1c734a716eaba8dd302dc54e6a4d3a9a34fed0d8e903ddb9624f2a47355"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.3/cursor-acp-1.0.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f763c232662bf46b4e808eb15909d4df14e0687a75c50ab2ca27516c1c0f4bd"
    end
  end

  def install
    bin.install "cursor-acp"
  end

  test do
    assert_match "cursor-acp", shell_output("#{bin}/cursor-acp --help")
  end
end

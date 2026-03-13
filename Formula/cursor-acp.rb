class CursorAcp < Formula
  desc "ACP proxy for Cursor CLI"
  homepage "https://github.com/cameroncooper/cursor-acp"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.10/cursor-acp-1.0.10-aarch64-apple-darwin.tar.gz"
      sha256 "8221ba45b3247b85e3730ba4536c19dacc641fed581f1ef6d2eafb1585ee04bc"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.10/cursor-acp-1.0.10-x86_64-apple-darwin.tar.gz"
      sha256 "3fd94b3ea71ab85d232cf26c80066ebe4518304e87dbe457fb8208128ff58a35"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.10/cursor-acp-1.0.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ee6210547d8826bc70c632669340a753a20ccb6e713f7a80caef25c2440704e"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.10/cursor-acp-1.0.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12f2ddc065ac1d1509f7105b55b7b43722f49519e312859ecabd4bcedfdf88a3"
    end
  end

  def install
    bin.install "cursor-acp"
  end

  test do
    assert_match "cursor-acp", shell_output("#{bin}/cursor-acp --help")
  end
end

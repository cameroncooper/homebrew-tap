class CursorAcp < Formula
  desc "ACP proxy for Cursor CLI"
  homepage "https://github.com/cameroncooper/cursor-acp"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.8/cursor-acp-1.0.8-aarch64-apple-darwin.tar.gz"
      sha256 "fd50f92cf364b7e88cbc2bbc7c3d282012e1fc3f8521a0e52de773ae31640eca"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.8/cursor-acp-1.0.8-x86_64-apple-darwin.tar.gz"
      sha256 "2a15ed5a04e3b1f4080da80ae13dd25aed7a0ddddca783f57498d01e5ee43538"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.8/cursor-acp-1.0.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2883f41d4c80abc735aebba551decf931da59cd44580415b88aab07e79075aa"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.8/cursor-acp-1.0.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63e756cbe7eea77bbad470ddd2556ce0b09968464b9906f12f40dac5a61f2b3c"
    end
  end

  def install
    bin.install "cursor-acp"
  end

  test do
    assert_match "cursor-acp", shell_output("#{bin}/cursor-acp --help")
  end
end

class CursorAcp < Formula
  desc "ACP proxy for Cursor CLI"
  homepage "https://github.com/cameroncooper/cursor-acp"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.1/cursor-acp-1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "REPLACE_MACOS_ARM64_SHA256"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.1/cursor-acp-1.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "REPLACE_MACOS_X64_SHA256"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.1/cursor-acp-1.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_LINUX_ARM64_SHA256"
    else
      url "https://github.com/cameroncooper/cursor-acp/releases/download/v1.0.1/cursor-acp-1.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "REPLACE_LINUX_X64_SHA256"
    end
  end

  def install
    bin.install "cursor-acp"
  end

  def caveats
    <<~EOS
      To use cursor-acp in Zed, add this to your Zed settings file:
        ~/.config/zed/settings.json

      {
        "agent_servers": {
          "Cursor CLI": {
            "type": "custom",
            "command": "#{opt_bin}/cursor-acp",
            "args": [],
            "env": {
              "RUST_LOG": "info"
            }
          }
        }
      }

      Then restart Zed.
    EOS
  end

  test do
    assert_match "cursor-acp", shell_output("#{bin}/cursor-acp --help")
  end
end

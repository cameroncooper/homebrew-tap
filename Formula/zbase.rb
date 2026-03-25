class Zbase < Formula
  desc "A fast, native chat client"
  homepage "https://github.com/cameroncooper/zbase"
  url "https://github.com/cameroncooper/zbase/archive/refs/tags/v1.0.10.tar.gz"
  sha256 "f0d788e763db1b1dc28bc9807c4680db294eabcf85f371b6cecc1ffd9650e71e"
  license "MIT"

  depends_on "rust" => :build
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on :macos
  depends_on "ffmpeg"

  def install
    system "cargo", "build", "--release", "--locked"

    bin.install "target/release/zbase"

    app = prefix/"zBase.app/Contents"
    (app/"MacOS").mkpath
    (app/"Resources").mkpath

    cp bin/"zbase", app/"MacOS/zbase"
    cp "assets/macos/AppIcon.icns", app/"Resources/AppIcon.icns" if File.exist?("assets/macos/AppIcon.icns")

    (app/"Info.plist").write <<~PLIST
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>CFBundleDevelopmentRegion</key>
        <string>en</string>
        <key>CFBundleDisplayName</key>
        <string>zBase</string>
        <key>CFBundleExecutable</key>
        <string>zbase</string>
        <key>CFBundleIconFile</key>
        <string>AppIcon</string>
        <key>CFBundleIdentifier</key>
        <string>com.zbase.app</string>
        <key>CFBundleInfoDictionaryVersion</key>
        <string>6.0</string>
        <key>CFBundleName</key>
        <string>zBase</string>
        <key>CFBundlePackageType</key>
        <string>APPL</string>
        <key>CFBundleShortVersionString</key>
        <string>#{version}</string>
        <key>CFBundleVersion</key>
        <string>#{version}</string>
        <key>LSMinimumSystemVersion</key>
        <string>13.0</string>
        <key>NSHighResolutionCapable</key>
        <true/>
      </dict>
      </plist>
    PLIST
  end

  def caveats
    <<~EOS
      The zBase.app bundle has been installed to:
        #{prefix}/zBase.app

      To add it to your Applications folder:
        ln -sf #{prefix}/zBase.app /Applications/zBase.app
    EOS
  end

  test do
    assert_predicate bin/"zbase", :executable?
  end
end

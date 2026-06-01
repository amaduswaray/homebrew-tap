class Shellql < Formula
  desc "Vim- and tmux-inspired terminal database manager for developers"
  homepage "https://github.com/amaduswaray/ShellQL"
  version "0.1.6-beta"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/amaduswaray/ShellQL/releases/download/v0.1.6-beta/shql-macos-arm64"
      sha256 "cd3ff68d5de979220cd79c5f8b25d64a2c236edb7a98c43a858b3f3318b51f61"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/amaduswaray/ShellQL/releases/download/v0.1.6-beta/shql-linux-x86_64"
      sha256 "b1d8c88fbdaca001411c7c239235b8978b15af20e147e95aaac6ef3354218d7b"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "shql-macos-arm64" => "shql"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "shql-linux-x86_64" => "shql"
    else
      odie "Unsupported platform for shellql"
    end
  end

  test do
    assert_match "ShellQL", shell_output("#{bin}/shql --help")
  end
end

class Shellql < Formula
  desc "Vim- and tmux-inspired terminal database manager for developers"
  homepage "https://github.com/amaduswaray/ShellQL"
  version "0.1.7-beta"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/amaduswaray/ShellQL/releases/download/v0.1.7-beta/shql-macos-arm64"
      sha256 "63f541f505593a6f3c0eac57ba308ca6a28c319f56b2be3788ca55d9a5d42f5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/amaduswaray/ShellQL/releases/download/v0.1.7-beta/shql-linux-x86_64"
      sha256 "18b8158c44d63d0d22f59ffbbffd7d4d758230d63701a4e64602c3aacc95ac20"
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

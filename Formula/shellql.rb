class Shellql < Formula
  desc "Vim- and tmux-inspired terminal database manager for developers"
  homepage "https://github.com/amaduswaray/ShellQL"
  version "0.1.4-beta"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/amaduswaray/ShellQL/releases/download/v0.1.4-beta/shql-macos-arm64"
      sha256 "7882a8b6db2f88757e18032ec8ba99af51c5ed4940718544f4581f9555b598b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/amaduswaray/ShellQL/releases/download/v0.1.4-beta/shql-linux-x86_64"
      sha256 "1a6c795ae4918e9e173f532246944bd6085e5bc5a729a145eee17d5e0aadfb53"
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

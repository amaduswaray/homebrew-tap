class Shellql < Formula
  desc "Vim- and tmux-inspired terminal database manager for developers"
  homepage "https://github.com/amaduswaray/ShellQL"
  url "https://github.com/amaduswaray/ShellQL/archive/refs/tags/v0.1.2-beta.tar.gz"
  sha256 "2e041aaa04cc79e1c7ba89a931d1bee00f9989e294bd1910bcafd9c45fd32339"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "ShellQL", shell_output("#{bin}/shql --help")
  end
end

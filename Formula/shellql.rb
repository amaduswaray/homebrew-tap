class Shellql < Formula
  desc "Vim- and tmux-inspired terminal database manager for developers"
  homepage "https://github.com/amaduswaray/ShellQL"
  url "https://github.com/amaduswaray/ShellQL/archive/refs/tags/v0.1.3-beta.tar.gz"
  sha256 "be269c803d62678d423e4d2696c68253402e6de4528f236e0d9545c0fca82fc1"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "ShellQL", shell_output("#{bin}/shql --help")
  end
end

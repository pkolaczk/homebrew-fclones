class Fclones < Formula
  desc "Efficient Duplicate File Finder"
  homepage "https://github.com/pkolaczk/fclones"
  url "https://github.com/pkolaczk/fclones/archive/refs/tags/v0.22.0.zip"
  sha256 "15789440113070872d752eb9bc2175941b518d0b8dc5cd3c83e92ce2d104c8e5"
  license "MIT"
  version "0.22.0"

  bottle do
    sha256 arm64_monterey: "cdd48ab11d276a08038cb4658a27ce84194bb846afa466e13092d5e07514f7e6"
    sha256 arm64_big_sur:  "e73ee2bf4aa2d611e589927c84c3dd94c1aabda01a77d07c6cfcecaf5dab0def"
    sha256 monterey:       "69ec4cdabb778f96cf8de9e6e4b1b960f0cf84b8fa40e5d2febffd53122c135f"
    sha256 big_sur:        "1adf5c2ec24d14ccf3ac53a16155ebdc0344ccca341ec847d5a0f52c68a8d20a"
    sha256 catalina:       "fd45807590d9bbc0c17ce120657df9b229b63ff4462b067dc75709bc0a6a8702"
    sha256 x86_64_linux:   "cb57248c88b8988f1fa9c45a0d39cd35c5c12cabbce1c4699c72f85493787ea4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"foo1.txt").write "foo"
    (testpath/"foo2.txt").write "foo"
    (testpath/"foo3.txt").write "foo"
    (testpath/"bar1.txt").write "bar"
    (testpath/"bar2.txt").write "bar"
    output = shell_output("fclones group #{testpath}")
    assert_match "Redundant: 9 B (9 B) in 3 files", output
    assert_match "a9707ebb28a5cf556818ea23a0c7282c", output
    assert_match "16aa71f09f39417ecbc83ea81c90c4e7", output
  end
end


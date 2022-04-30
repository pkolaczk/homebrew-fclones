class Fclones < Formula
  desc "Efficient Duplicate File Finder"
  homepage "https://github.com/pkolaczk/fclones"
  url "https://github.com/pkolaczk/fclones/releases/download/v0.22.0/fclones-0.22.0-apple-darwin.x86_64.tar.gz"
  sha256 "b1194d46fa6d888258df7ab80d49613eb76ab01304dad1796535718b5c77f65a"
  license "MIT"
  version "0.22.0"
  
  def install
    bin.install "fclones"
  end
end


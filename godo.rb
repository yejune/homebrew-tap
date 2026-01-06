class Godo < Formula
  desc "CLI installer for Do - Claude Code project environment"
  homepage "https://github.com/yejune/do"
  url "https://github.com/yejune/do/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "2e6b53cfdc9a111bdd0a4b4fb361c624bc242fd9da0e3c40b1be41a04adffc5d"
  license "MIT"
  head "https://github.com/yejune/do.git", branch: "main"

  depends_on "go" => :build

  def install
        bin.install "godo"
  end

  def test
        assert_match "godo version", shell_output("#{bin}/godo version")
  end

  def caveats
    <<~EOS
            godo has been installed!
      
      Usage:
        cd my-project
        godo init      # Install Do
        godo update    # Update Do
    EOS
  end
end

class Godo < Formula
  desc "CLI installer for Do - Claude Code project environment"
  homepage "https://github.com/yejune/do"
  url "https://github.com/yejune/do/archive/refs/tags/v0.1.23.tar.gz"
  sha256 "1a68122db6fd5eb3d621f41c59771f45a051b3cdf458379363484e761f659939"
  license "MIT"
  head "https://github.com/yejune/do.git", branch: "main"

  depends_on "go" => :build

  def install
        system "go", "build", "-ldflags", "-X main.version=#{version}", "-o", "godo", "./cmd/godo/"
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

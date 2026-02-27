class Godo < Formula
  desc "Do framework CLI — extract, assemble, and manage .claude/ personas"
  homepage "https://github.com/yejune/godo"
  url "https://github.com/yejune/godo/archive/refs/tags/v0.3.26.tar.gz"
  sha256 "10ce26da55474b1938fe1de1d74b9ba36b83e1af6f5924013fd82718e283065d"
  license "MIT"
  head "https://github.com/yejune/godo.git", branch: "main"

  depends_on "go" => :build

  def install
        system "go", "build", "-ldflags", "-X main.version=#{version}", "-o", "godo", "./cmd/godo/"
    bin.install "godo"
  end

  def test
        assert_match "godo", shell_output("#{bin}/godo --help")
  end

  def caveats
    <<~EOS
            godo has been installed!
      
      Usage:
        godo extract     # Extract moai-adk into core/persona layers
        godo assemble    # Assemble persona package
        godo sync        # Install Do into a project
    EOS
  end
end

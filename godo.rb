class Godo < Formula
  desc "Do framework CLI — extract, assemble, and manage .claude/ personas"
  homepage "https://github.com/yejune/godo"
  url "https://github.com/yejune/godo/archive/refs/tags/v0.3.37.tar.gz"
  sha256 "6b348aabb392d2b5d4f35e9471f25f0072b4f67833e34da94c9292d1e45f0ab2"
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

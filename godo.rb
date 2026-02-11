class Godo < Formula
  desc "CLI installer for Do - Claude Code project environment"
  homepage "https://github.com/yejune/do-focus"
  url "https://github.com/yejune/do-focus/archive/refs/tags/v0.1.108.tar.gz"
  sha256 "fe668f30c6dfd48d8af82ab8200fc36f5312b6a1f9af2750642db184e1c6b987"
  license "MIT"
  head "https://github.com/yejune/do-focus.git", branch: "main"

  depends_on "go" => :build

  def install
        system "go", "build", "-ldflags", "-X main.version=#{version}", "-o", "godo", "./cmd/godo/"
    Dir.chdir(".do/worker") do
      system "go", "build", "-ldflags", "-X main.version=#{version}", "-o", "../../godo-worker", "./cmd/worker/"
    end
    bin.install "godo"
    bin.install "godo-worker"
  end

  def test
        assert_match "godo version", shell_output("#{bin}/godo version")
  end

  def caveats
    <<~EOS
            godo has been installed!
      
      Usage:
        cd my-project
        godo sync             # Install or update Do
        godo worker start     # Start memory worker
    EOS
  end
end

class Godo < Formula
  desc "CLI installer for Do - Claude Code project environment"
  homepage "https://github.com/yejune/do-focus"
  url "https://github.com/yejune/do-focus/archive/refs/tags/v0.2.25.tar.gz"
  sha256 "bf0f49b2b1cee5b2a76fbf4de9d6d18346d155855e54f7ed8fcbd6a009daa43a"
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

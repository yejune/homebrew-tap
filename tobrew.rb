class Tobrew < Formula
  desc "Automated Homebrew tap release tool for CLI projects"
  homepage "https://github.com/yejune/tobrew"
  url "https://github.com/yejune/tobrew/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "3fa364eb8e3ded392cb0e012d5b5f2f16f22fc7f42356a3ee919b0e79af77239"
  license "MIT"
  head "https://github.com/yejune/tobrew.git", branch: "main"

  depends_on "go" => :build

  def install
        system "go", "build", "."
    bin.install "tobrew"

  end

  def test
        assert_match "tobrew version", shell_output("#{bin}/tobrew --version")

  end

  def caveats
    <<~EOS
            tobrew has been installed!
      
      Simple workflow:
        1. tobrew init              # Create config (once)
        2. tobrew release           # Release with patch bump
        3. tobrew release --minor   # Minor version bump
        4. tobrew release --major   # Major version bump
      
      Documentation: https://github.com/yejune/tobrew
      
    EOS
  end
end

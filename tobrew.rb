class Tobrew < Formula
  desc "Automated Homebrew tap release tool for CLI projects"
  homepage "https://github.com/yejune/tobrew"
  url "https://github.com/yejune/tobrew/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "bddc840943d3989345514fe441724f5676ab677db1ca6cc6ef3d1b5a787e1454"
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

class Tobrew < Formula
  desc "Automated Homebrew tap release tool for CLI projects"
  homepage "https://github.com/yejune/tobrew"
  url "https://github.com/yejune/tobrew/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "5e9428e858480c4893b135af1aad7518af7a17f5623b83c275d8e22d5f1f4702"
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

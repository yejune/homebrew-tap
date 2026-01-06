class GitSubclone < Formula
  desc "Manage nested git repositories with independent push capability"
  homepage "https://github.com/yejune/git-subclone"
  url "https://github.com/yejune/git-subclone/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "4bca3a197c069f146102fc15ac717501be075be863b136f56309ccc735225c9b"
  license "MIT"
  head "https://github.com/yejune/git-subclone.git", branch: "main"

  depends_on "go" => :build

  def install
        system "go", "build", "-o", "git-subclone", "."
    bin.install "git-subclone"
  end

  def test
        assert_match "version", shell_output("#{bin}/git-subclone --version")
  end

  def caveats
    <<~EOS
            git-subclone has been installed!
      
      Quick Start:
        git subclone https://github.com/user/repo.git
        git subclone https://github.com/user/repo.git packages/repo
        git subclone -b develop https://github.com/user/repo.git
      
      Commands:
        git subclone sync      Sync all subclones
        git subclone list      List subclones
        git subclone push      Push subclone(s)
        git subclone status    Show status
    EOS
  end
end

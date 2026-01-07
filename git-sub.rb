class GitSub < Formula
  desc "Manage nested git repositories with independent push capability"
  homepage "https://github.com/yejune/git-sub"
  url "https://github.com/yejune/git-sub/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "02242148be202659a4b6ca8980a15899cf5b2852564e849393f25b195057f31b"
  license "MIT"
  head "https://github.com/yejune/git-sub.git", branch: "main"

  depends_on "go" => :build

  def install
        ldflags = "-X github.com/yejune/git-sub/cmd.Version=#{version}"
    system "go", "build", "-ldflags", ldflags, "-o", "git-sub", "."
    bin.install "git-sub"
  end

  def test
        assert_match "version", shell_output("#{bin}/git-sub --version")
  end

  def caveats
    <<~EOS
            git-sub has been installed!
      
      Quick Start:
        git-sub https://github.com/user/repo.git
        git-sub https://github.com/user/repo.git packages/repo
        git-sub -b develop https://github.com/user/repo.git
      
      Commands:
        git-sub sync      Apply configuration
        git-sub list      List subs
        git-sub push      Push sub(s)
        git-sub status    Show status
        git-sub branch    Show branch info
    EOS
  end
end

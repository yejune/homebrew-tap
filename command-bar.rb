class CommandBar < Formula
  desc "Command launcher and schedule reminder app for macOS"
  homepage "https://github.com/yejune/command-bar"
  url "https://github.com/yejune/command-bar/archive/refs/tags/v0.0.19.tar.gz"
  sha256 "379397b6820f0b54135f6062a3fce80a884b392c5f71740af4a012814e2ce52d"
  license "MIT"
  head "https://github.com/yejune/command-bar.git", branch: "main"

  def install
        prefix.install "CommandBar.app"
    bin.install_symlink prefix/"CommandBar.app/Contents/MacOS/CommandBar" => "command-bar"
  end

  def test
        system "#{bin}/command-bar", "--help"
  end

  def caveats
    <<~EOS
            CommandBar.app has been installed to:
        #{prefix}/CommandBar.app
      
      To start CommandBar, run:
        open #{prefix}/CommandBar.app
      
      Or add to your Applications folder:
        ln -sf #{prefix}/CommandBar.app /Applications/
    EOS
  end
end

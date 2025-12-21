class CommandBar < Formula
  desc "Command launcher and schedule reminder app for macOS"
  homepage "https://github.com/yejune/command-bar"
  url "https://github.com/yejune/command-bar/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "d7c9dbc0866b78f98363d48a8c14b7730c09ea8decdb05e99c9dff3b93ee140d"
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

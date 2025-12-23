class CommandBar < Formula
  desc "Command launcher and schedule reminder app for macOS"
  homepage "https://github.com/yejune/command-bar"
  url "https://github.com/yejune/command-bar/archive/refs/tags/v0.0.12.tar.gz"
  sha256 "5660daba703425587cb31c246fbd7cbf8793084ad3cdeac4ac6a49ef6045236a"
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

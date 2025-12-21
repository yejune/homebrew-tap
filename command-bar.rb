class CommandBar < Formula
  desc "Command launcher and schedule reminder app for macOS"
  homepage "https://github.com/yejune/command-bar"
  url "https://github.com/yejune/command-bar/archive/refs/tags/v0.0.10.tar.gz"
  sha256 "6e69751f7035a8277837608bfea5e73af697b7e91640cc612d56a005b54f0691"
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

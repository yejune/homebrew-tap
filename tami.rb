class Tami < Formula
  desc "Terminal-first macOS file navigator with tabs and an embedded terminal"
  homepage "https://github.com/yejune/tami"
  url "https://github.com/yejune/tami/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "20fb840d9e7067b42613f4235e7fb79a7145b1a4d624d6ce3357801c71bde81e"
  license "UNLICENSED"
  head "https://github.com/yejune/tami.git", branch: "main"

  def install
        prefix.install "Tami.app"
  end

  def test
        system "true"
  end

  def caveats
    <<~EOS
            Tami has been installed.
      
      Open it from Finder or run: open Tami.app
    EOS
  end
end

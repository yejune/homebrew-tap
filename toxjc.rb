class Toxjc < Formula
  desc "File format conversion utility (CSV, JSON, XLSX, XLS)"
  homepage "https://github.com/yejune/toxjc"
  url "https://github.com/yejune/toxjc/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "cec26257ad4e256959b71b06c3bbc73bc70196b125766727b6dd185016d5a5c7"
  license "MIT"
  head "https://github.com/yejune/toxjc.git", branch: "main"

  depends_on "go" => :build

  def install
        system "go", "build", "-o", "toxjc", "."
    bin.install "toxjc"
  end

  def test
        assert_match "toxjc", shell_output("#{bin}/toxjc version")
  end

  def caveats
    <<~EOS
            toxjc has been installed!
      
      Run 'toxjc --help' to get started.
    EOS
  end
end

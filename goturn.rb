class Goturn < Formula
  desc "Quick Cloudflare Tunnel manager for local development"
  homepage "https://github.com/yejune/goturn"
  url "https://github.com/yejune/goturn/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "0daf4c2b1d551d878f95b57941ecf2c448723d8c4c4797262c5ec23c22ba088d"
  license "MIT"
  head "https://github.com/yejune/goturn.git", branch: "main"

  depends_on "go" => :build

  def install
        system "go", "build", *std_go_args(output: bin/"goturn"), "."

  end

  def test
        assert_match "goturn", shell_output("#{bin}/goturn --help")

  end

  def caveats
    <<~EOS
            goturn has been installed!
      
      Quick Start:
        1. Create ~/.goturn.yaml:
           tunnels:
             - name: myapp
               url: https://myapp.test
      
        2. Run:
           goturn
      
        3. Access your app via the generated trycloudflare.com URL
      
      Requirements:
        brew install cloudflared
      
      Documentation: https://github.com/yejune/goturn
      
    EOS
  end
end

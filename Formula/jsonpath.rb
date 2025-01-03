class Jsonpath < Formula
  desc "RFC 9535 compliant JSONPath processor with beautiful colored output"
  homepage "https://github.com/davidhoo/jsonpath"
  version "2.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v2.0.1/jp-darwin-arm64.tar.gz"
      sha256 "64f1302d48fbf1a7490afcf4fd5ce641e47ea2a0852f117ca59d4fca6dc73777"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v2.0.1/jp-darwin-amd64.tar.gz"
      sha256 "04b79ac35fb012379e5b8357cc68576bdc5bd9e828cab8d094a7f7950ac17f35"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v2.0.1/jp-linux-arm64.tar.gz"
      sha256 "041784daf8fea751d7f73329c0a96fe691078570ce4b123812f53e1c5a7847f8"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v2.0.1/jp-linux-amd64.tar.gz"
      sha256 "f8b462fdb84526868fbc271a08db54e8ea5715c0f09ab13a2d57867dd9ca883c"
    end
  end

  def install
    bin.install "jp"
  end

  test do
    assert_equal "\"jp\"", shell_output("#{bin}/jp -p '$.name' <<< '{\"name\":\"jp\"}'").strip
  end
end 
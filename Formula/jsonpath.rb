class Jsonpath < Formula
  desc "RFC 9535 compliant JSONPath processor with beautiful colored output"
  homepage "https://github.com/davidhoo/jsonpath"
  version "1.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v1.0.3/jp-darwin-arm64.tar.gz"
      sha256 "c6881a8cea74e3759de052ee97a9ebf588c3acb6fddaa0215e04ce958e9322ed"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v1.0.3/jp-darwin-amd64.tar.gz"
      sha256 "a27021d3fa117f6d3b196486ad2df00a6afb6196a3ab77da9b0bc61248573926"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v1.0.3/jp-linux-arm64.tar.gz"
      sha256 "47016d5ba5d439d02b31da1ae5191112b54ac5f4769d93990d349caa74d37ce7"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v1.0.3/jp-linux-amd64.tar.gz"
      sha256 "5dad5c444999dfac65749bd7a9653547bf859e5b8269a207c8d140f31a565bea"
    end
  end

  def install
    bin.install "jp"
  end

  test do
    assert_equal "\"jp\"", shell_output("#{bin}/jp -p '$.name' <<< '{\"name\":\"jp\"}'").strip
  end
end 
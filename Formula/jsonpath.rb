class Jsonpath < Formula
  desc "RFC 9535 compliant JSONPath processor with beautiful colored output"
  homepage "https://github.com/davidhoo/jsonpath"
  version "2.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v2.0.1/jp-darwin-arm64.tar.gz"
      sha256 "f61f2c6db3a650b2ffa1f501727b0b74641637687c2cf841217ad710401217d1"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v2.0.1/jp-darwin-amd64.tar.gz"
      sha256 "3bb38be712d7687e1bde8b3661c425184d0a6217c72647f252c5552f0770a965"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v2.0.1/jp-linux-arm64.tar.gz"
      sha256 "41926cfb0d19dcac79bc1493cb28e845eabe08bb68eede541727fad4e890b53f"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v2.0.1/jp-linux-amd64.tar.gz"
      sha256 "42d655de37b660e7775f844b922bb75df6811f50239d5e3c28f0122d820a8108"
    end
  end

  def install
    bin.install "jp"
  end

  test do
    assert_equal "\"jp\"", shell_output("#{bin}/jp -p '$.name' <<< '{\"name\":\"jp\"}'").strip
  end
end 
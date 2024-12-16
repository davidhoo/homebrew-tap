class Jsonpath < Formula
  desc "RFC 9535 compliant JSONPath processor with beautiful colored output"
  homepage "https://github.com/davidhoo/jsonpath"
  version "1.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v1.0.4/jp-darwin-arm64.tar.gz"
      sha256 "3912063b5b36680811f9da2964552552b6b9d1d7fc1db5a542a72c4b88b0fd22"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v1.0.4/jp-darwin-amd64.tar.gz"
      sha256 "1ce80c0d6c813283a391c17c032eaa9481c528ed7fb91280563ed6ac307d996c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v1.0.4/jp-linux-arm64.tar.gz"
      sha256 "eabad9ad8a70f65ea3f8e8fe7cd9162de991868c8c38636df3852616d6b31ad3"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v1.0.4/jp-linux-amd64.tar.gz"
      sha256 "62cbeb3724d42d5e047d042c265d3186cb2151b054a5c50e4a17965a484ed2c1"
    end
  end

  def install
    bin.install "jp"
  end

  test do
    assert_equal "\"jp\"", shell_output("#{bin}/jp -p '$.name' <<< '{\"name\":\"jp\"}'").strip
  end
end 
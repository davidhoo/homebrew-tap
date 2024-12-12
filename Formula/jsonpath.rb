class Jsonpath < Formula
  desc "RFC 9535 compliant JSONPath implementation in Go"
  homepage "https://github.com/davidhoo/jsonpath"
  version "1.0.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v1.0.0/jp-darwin-arm64.tar.gz"
      sha256 "05ca13767b6d9aad6f94378cf35d4fb1da9c48d3d18d9a407f6fed7bdb3aa4e4"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v1.0.0/jp-darwin-amd64.tar.gz"
      sha256 "418c146536bfe2f662832434662f8fa2303b9de768cadc27c8e11ec145c3a929"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v1.0.0/jp-linux-arm64.tar.gz"
      sha256 "c7d96c3f191f1b2629442ec85ef2396eeecb0597df583ad9953d7d8c4a78d5ee"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v1.0.0/jp-linux-amd64.tar.gz"
      sha256 "4aa7c75d962d4a1c20672aca3ea7755372770df6148bf927e0ff98d735399135"
    end
  end

  def install
    bin.install "jp"
  end

  test do
    (testpath/"test.json").write '{"name": "homebrew"}'
    assert_equal "\"homebrew\"", shell_output("#{bin}/jp -f #{testpath}/test.json -p '$.name'").strip
  end
end 
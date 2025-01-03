class Jsonpath < Formula
  desc "RFC 9535 compliant JSONPath processor with beautiful colored output"
  homepage "https://github.com/davidhoo/jsonpath"
  version "2.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v2.0.1/jp-darwin-arm64.tar.gz"
      sha256 "23ff9552f815e5e99c7399b107a836e38e62d51d604552298dd1f4939cc693eb"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v2.0.1/jp-darwin-amd64.tar.gz"
      sha256 "295484f38043a27dbbf9c39c6d282e2680ef0eae6dd248820f1523857f3a118a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v2.0.1/jp-linux-arm64.tar.gz"
      sha256 "98669d1164db897361621fb4ac99ad158a16b4c73cd8224c54379a29241a1192"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v2.0.1/jp-linux-amd64.tar.gz"
      sha256 "c89b33b7c6c5f2b4833403d32a5c1d69b94345db748f9b52d874903ef3d78831"
    end
  end

  def install
    bin.install "jp"
  end

  test do
    assert_equal "\"jp\"", shell_output("#{bin}/jp -p '$.name' <<< '{\"name\":\"jp\"}'").strip
  end
end 
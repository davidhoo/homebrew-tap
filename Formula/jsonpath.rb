class Jsonpath < Formula
  desc "RFC 9535 compliant JSONPath processor with beautiful colored output"
  homepage "https://github.com/davidhoo/jsonpath"
  version "3.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v3.0.0/jsonpath_Darwin_arm64.tar.gz"
      sha256 "5dae0d97705c3b4e47b38156a1c4a424484cb5a4324e165b6b1c1d9fa3863dd0"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v3.0.0/jsonpath_Darwin_x86_64.tar.gz"
      sha256 "892a9261030d0b7a3c815bb5ced7e24b89a7afa36e8a1091afae81d7b1771598"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/davidhoo/jsonpath/releases/download/v3.0.0/jsonpath_Linux_arm64.tar.gz"
      sha256 "7270c2e247f868607901e019af9c4cb86200b02c0761e4519affcc754d427788"
    elsif Hardware::CPU.is_32_bit?
      url "https://github.com/davidhoo/jsonpath/releases/download/v3.0.0/jsonpath_Linux_i386.tar.gz"
      sha256 "0c9b3d8b2fdd3980ee04b4cf5382f7db7afede40ecda439790731fc27664325e"
    else
      url "https://github.com/davidhoo/jsonpath/releases/download/v3.0.0/jsonpath_Linux_x86_64.tar.gz"
      sha256 "14637f2fa5aace1686432a0934b75391d3e13ad99fd76915fa99017046181504"
    end
  end

  def install
    bin.install "jsonpath" => "jp"
  end

  test do
    assert_match "v3.0.0", shell_output("#{bin}/jp -v")
    assert_equal '"test"', shell_output("#{bin}/jp -p '$.name' <<< '{\"name\":\"test\"}'").strip
  end
end

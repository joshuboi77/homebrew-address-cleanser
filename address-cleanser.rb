class AddressCleanser < Formula
  desc "Parse, validate, and format US addresses"
  homepage "https://github.com/joshuboi77/address-cleanser"
  version "1.0.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/joshuboi77/address-cleanser/releases/download/v1.0.14/address-cleanser-macos-arm64.zip"
      sha256 "0b7280dee0c7a4a5a5733131e16f51fbf582c4e0682b1e765453ff18ba047c9a"
    else
      url "https://github.com/joshuboi77/address-cleanser/releases/download/v1.0.14/address-cleanser-macos-x86_64.zip"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "address-cleanser"
  end

  test do
    output = shell_output("#{bin}/address-cleanser --help")
    assert_match "Usage:", output
  end
end

class AddressCleanser < Formula
  desc "Parse, validate, and format US addresses"
  homepage "https://github.com/joshuboi77/address-cleanser"
  version "1.0.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/joshuboi77/address-cleanser/releases/download/v1.0.13/address-cleanser-macos-arm64.zip"
      sha256 "0d8e0914425da57589d9cd7f837eadd0e7e6d87072c97e311ad1e44811667ae0"
    else
      url "https://github.com/joshuboi77/address-cleanser/releases/download/v1.0.13/address-cleanser-macos-x86_64.zip"
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

class AddressCleanser < Formula
  desc "Parse, validate, and format US addresses"
  homepage "https://github.com/joshuboi77/address-cleanser"
  version "1.0.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/joshuboi77/address-cleanser/releases/download/v1.0.12/address-cleanser-macos-arm64.zip"
      sha256 "04bcbba79157c8421eb0a387f00668cd66f874593d8610349d15bb4eb5dbe72a"
    else
      url "https://github.com/joshuboi77/address-cleanser/releases/download/v1.0.12/address-cleanser-macos-x86_64.zip"
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

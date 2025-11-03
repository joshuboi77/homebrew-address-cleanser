class AddressCleanser < Formula
  desc "None"
  homepage "None"
  version "1.0.29"


  # Python package - install via pip so wrapper script can import it
  depends_on "python@3.11"


  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/joshuboi77/address-cleanser/releases/download/v1.0.29/address-cleanser-darwin-arm64.tar.gz"
      sha256 "10546a5eb8a7518f442e3acb3595a931de22ad61154f4dd1f8236ee9fad331bd"
    else
      url "https://github.com/joshuboi77/address-cleanser/releases/download/v1.0.29/address-cleanser-darwin-amd64.tar.gz"
      sha256 "f81335ea18f76af98fe2df57d0b8478d87a2cd33fbfd2c355b7ec7b2f75de2b3"
    end
  end

  on_linux do
    url "https://github.com/joshuboi77/address-cleanser/releases/download/v1.0.29/address-cleanser-linux-amd64.tar.gz"
    sha256 "0a8a68ae896afa602cd04f0a35808c58f45cfbfee516e0de7c85e68c16cc1058"
  end

  def install
    # Install wrapper script from bin/ directory in tarball
    bin.install "bin/address-cleanser" => "address-cleanser"

    # Install Python package so wrapper script can import it
    # The wrapper script does "from address-cleanser.main import main" so package must be installed
    # Package source is included in the tarball, install from extracted source
    python3 = "python3.11"
    if File.exist?("pyproject.toml")
      # Install from pyproject.toml in the extracted tarball
      system python3, "-m", "pip", "install", "--prefix", prefix, "--no-build-isolation", "."
    elsif File.exist?("setup.py")
      # Fallback for setup.py
      system python3, "-m", "pip", "install", "--prefix", prefix, "--no-build-isolation", "."
    else
      # Try installing package name from bundled source
      package_dir = "address-cleanser"
      if Dir.exist?(package_dir)
        # Create a minimal setup.py if needed
        File.write("setup.py", "from setuptools import setup; setup(name='address-cleanser', version='1.0.29')")
        system python3, "-m", "pip", "install", "--prefix", prefix, "--no-build-isolation", "."
      end
    end

  end

  test do
    assert_match "1.0.29", shell_output("#{bin}/address-cleanser --version")
  end
end

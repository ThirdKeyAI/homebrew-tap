class Symbi < Formula
  desc "Autonomous agent runtime with DSL, toolchain, and reasoning loop"
  homepage "https://symbiont.dev"
  version "1.9.1"
  license "Apache-2.0"

  on_macos do
    # Only Apple Silicon (ARM) is supported via pre-built binaries.
    # Intel Mac users: cargo install symbi
    url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "7247d27cb450dbd18b4d49b4ededa72eef519b8942047c28235ee0446e8a5e37"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "023bf3074cf55cb595e05d9e330774f633ebc7607fda92878abb42dd12b2c8f4"
    else
      url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19c440abb607518544a33e58ef9e0298d759b87a09e9e564d4023d3555c1bd0c"
    end
  end

  def install
    bin.install "symbi"
  end

  def caveats
    <<~EOS
      Pre-built binaries are tested but considered less reliable than
      building from source. If you encounter issues:
        cargo install symbi
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/symbi --version")
  end
end

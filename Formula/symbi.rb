class Symbi < Formula
  desc "Autonomous agent runtime with DSL, toolchain, and reasoning loop"
  homepage "https://symbiont.dev"
  version "1.17.0"
  license "Apache-2.0"

  on_macos do
    # Only Apple Silicon (ARM) is supported via pre-built binaries.
    # Intel Mac users: cargo install symbi
    url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "de899f29ac7b550417ae6cf542c0d8bba20dd2a098fbf44a03e23849fae121bb"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7ff43c173e040963f7195dc62c37fb61f7801ebebb03c9553c1529a4567bab0"
    else
      url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "631c62a9c6f07bae0bea28a33c586b950bcacf7e675b4cb56c45aa3679bc9505"
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

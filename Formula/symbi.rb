class Symbi < Formula
  desc "Autonomous agent runtime with DSL, toolchain, and reasoning loop"
  homepage "https://symbiont.dev"
  version "1.20.0"
  license "Apache-2.0"

  on_macos do
    # Only Apple Silicon (ARM) is supported via pre-built binaries.
    # Intel Mac users: cargo install symbi
    url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "4ea00dbab34ca80531baedd4d3dc380fbd42abadf75c39e2a8901b8b8fe4a645"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec43dfa0859c82c3f5f39fb2b4c61b9fb6476e1d85669ab669fbbf113d443f87"
    else
      url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3790bbe28ac03a9ed9ec2527ff68904c2879e00b013a8667168ba712f0f1153f"
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

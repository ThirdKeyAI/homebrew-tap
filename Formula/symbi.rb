class Symbi < Formula
  desc "Autonomous agent runtime with DSL, toolchain, and reasoning loop"
  homepage "https://symbiont.dev"
  version "1.14.2"
  license "Apache-2.0"

  on_macos do
    # Only Apple Silicon (ARM) is supported via pre-built binaries.
    # Intel Mac users: cargo install symbi
    url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "cfc49313f77c4220a1c16f872fc017adbdd7efa1555e41a832318631bef33339"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37efdc87cbd999ebff33eb28188cbe7e81dfba03a1e2680fad688c9f1e359b32"
    else
      url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb1177a81a85cf1ba8ebecf88996df5622a10333c52359f755d7509dd55bf7a8"
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

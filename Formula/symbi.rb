class Symbi < Formula
  desc "Autonomous agent runtime with DSL, toolchain, and reasoning loop"
  homepage "https://symbiont.dev"
  version "1.18.0"
  license "Apache-2.0"

  on_macos do
    # Only Apple Silicon (ARM) is supported via pre-built binaries.
    # Intel Mac users: cargo install symbi
    url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-aarch64-apple-darwin.tar.gz"
    sha256 "d166b3f62285afca4b50c4f6b33262c6042f3aabb033b3b99952cb24b93236c1"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e58fada3ec28c1dbae6e327e2c260429b1a3f04c5d692933fd64d86810288173"
    else
      url "https://github.com/thirdkeyai/symbiont/releases/download/v#{version}/symbi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc9033d9a73d7a029ce011b85629314d742aa1e5ecd9a29a37d6df6663879777"
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

class Meet < Formula
  desc "Command-line tool to find meeting times"
  homepage "https://github.com/alan-turing-institute/meet"
  url "https://github.com/alan-turing-institute/meet.git", tag: "v0.2.0.3", revision: "b43d59e8b1e0029194376ffb9aec2fc8e3831e8b"
  license "MIT"

  depends_on "cabal-install" => :build
  depends_on "ghc@9.4" => :build

  bottle do
    root_url "https://github.com/alan-turing-institute/meet/releases/download/v0.2.0.2"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "d18959344831b2e9edf63d9b05ac371ec54fa0fb97a93c753d1f7f2dbb777f19"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "d18959344831b2e9edf63d9b05ac371ec54fa0fb97a93c753d1f7f2dbb777f19"
  end

  def install
    system "cabal", "update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end
end

class Meet < Formula
  desc "Command-line tool to find meeting times"
  homepage "https://github.com/alan-turing-institute/meet"
  url "https://github.com/alan-turing-institute/meet.git", tag: "v0.2.0.3", revision: "b43d59e8b1e0029194376ffb9aec2fc8e3831e8b"
  license "MIT"

  depends_on "cabal-install" => :build
  depends_on "ghc@9.4" => :build

  bottle do
    root_url "https://github.com/alan-turing-institute/meet/releases/download/v0.2.0.2"
    # sha256 cellar: :any_skip_relocation, arm64_ventura: "5b8f4008e0baeed4f30a660eea83d1b4809a4e707dd9aca593d8c78c99f15324"
    # sha256 cellar: :any_skip_relocation, arm64_monterey: "5b8f4008e0baeed4f30a660eea83d1b4809a4e707dd9aca593d8c78c99f15324"
  end

  def install
    system "cabal", "update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end
end

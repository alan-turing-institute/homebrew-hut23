class Meet < Formula
  desc "Command-line tool to find meeting times"
  homepage "https://github.com/alan-turing-institute/meet"
  url "https://github.com/alan-turing-institute/meet.git", tag: "v0.2.0.1", revision: "33a9dfd38031012f2cc328f015f0505261e628c9"
  license "MIT"

  depends_on "cabal-install" => :build
  depends_on "ghc@9.4" => :build

  bottle do
    root_url "https://github.com/alan-turing-institute/meet/releases/download/v0.1.0.4"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "723bfd9f39e303786986bf2207125d91cd5647854a141b0cc1f6be83674c7f5c"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "723bfd9f39e303786986bf2207125d91cd5647854a141b0cc1f6be83674c7f5c"
  end

  def install
    system "cabal", "update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end
end

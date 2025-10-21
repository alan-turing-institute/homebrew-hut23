class Meet < Formula
  desc "Command-line tool to find meeting times"
  homepage "https://github.com/alan-turing-institute/meet"
  url "https://github.com/alan-turing-institute/meet.git", tag: "v0.2.0.6", revision: "91831b8aa6ee945b97fd2a2cfc8a9196e3306bf7"
  license "MIT"

  depends_on "cabal-install" => :build
  depends_on "ghc@9.4" => :build

  bottle do
    root_url "https://github.com/alan-turing-institute/meet/releases/download/v0.2.0.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ee4de6b15283044bd44db590dc0b997489d6abda6ba7e6be94e8a16b6f63fc9e"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "ee4de6b15283044bd44db590dc0b997489d6abda6ba7e6be94e8a16b6f63fc9e"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "ee4de6b15283044bd44db590dc0b997489d6abda6ba7e6be94e8a16b6f63fc9e"
  end

  def install
    system "cabal", "update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end
end

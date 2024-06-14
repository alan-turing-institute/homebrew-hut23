class Meet < Formula
  desc "Command-line tool to find meeting times"
  homepage "https://github.com/alan-turing-institute/meet"
  url "https://github.com/alan-turing-institute/meet.git", tag: "v0.1.0.3", revision: "d5604a2bd8f0278af7e8e30e5079a9c06936070f"
  license "MIT"

  depends_on "cabal-install" => :build
  depends_on "ghc@9.4" => :build

  bottle do
    root_url "https://github.com/alan-turing-institute/meet/releases/download/v0.1.0.3"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "c3df1b2184fcc71453ebce39cda0bd7256514ca335aa85faca4205f06fb1011d"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "c3df1b2184fcc71453ebce39cda0bd7256514ca335aa85faca4205f06fb1011d"
  end

  def install
    system "cabal", "update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end
end

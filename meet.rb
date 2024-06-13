class Meet < Formula
  desc "Command-line tool to find meeting times"
  homepage "https://github.com/alan-turing-institute/meet"
  url "https://github.com/alan-turing-institute/meet.git", tag: "v0.1.0.1", revision: "950a3f096cd8c219dacd60ffa833e9da4572b34d"
  license "MIT"

  depends_on "cabal-install" => :build
  depends_on "ghc@9.4" => :build

  # bottle do
  #   root_url "https://github.com/alan-turing-institute/whatwhat/releases/download/v0.0.29"
  #   sha256 cellar: :any, arm64_ventura: "a2e296b6a14b25de9fa7085010145a18f40bc91558b813a2eb2a68169b654fec"
  # end

  def install
    system "cabal", "update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end
end

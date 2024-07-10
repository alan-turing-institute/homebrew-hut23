class Meet < Formula
  desc "Command-line tool to find meeting times"
  homepage "https://github.com/alan-turing-institute/meet"
  url "https://github.com/alan-turing-institute/meet.git", tag: "v0.2.0.2", revision: "e93b111d46b4e6fcaf11a969506b11fd6248e3ab"
  license "MIT"

  depends_on "cabal-install" => :build
  depends_on "ghc@9.4" => :build

  bottle do
    root_url "https://github.com/alan-turing-institute/meet/releases/download/v0.2.0.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "892311a13b7b9fa3f1e05ebcda3adf648018752b21d7943b01ffdc9a4c486151"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "892311a13b7b9fa3f1e05ebcda3adf648018752b21d7943b01ffdc9a4c486151"
  end

  

  def install
    system "cabal", "update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end
end

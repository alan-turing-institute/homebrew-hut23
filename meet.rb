class Meet < Formula
  desc "Command-line tool to find meeting times"
  homepage "https://github.com/alan-turing-institute/meet"
  url "https://github.com/alan-turing-institute/meet.git", tag: "v0.2.0.5", revision: "007372aac5768c08166f2e37cb0732aa79dc16e2"
  license "MIT"

  depends_on "cabal-install" => :build
  depends_on "ghc@9.4" => :build

  bottle do
    root_url "https://github.com/alan-turing-institute/meet/releases/download/v0.2.0.5"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "945d1bf064784b7e47cddb5326db82ed99b61894517dea99889f9dbaae4fcc02"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "945d1bf064784b7e47cddb5326db82ed99b61894517dea99889f9dbaae4fcc02"
  end

  def install
    system "cabal", "update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end
end

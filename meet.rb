class Meet < Formula
  desc "Command-line tool to find meeting times"
  homepage "https://github.com/alan-turing-institute/meet"
  url "https://github.com/alan-turing-institute/meet.git", tag: "v0.2.0.5", revision: "007372aac5768c08166f2e37cb0732aa79dc16e2"
  license "MIT"

  depends_on "cabal-install" => :build
  depends_on "ghc@9.4" => :build

  bottle do
    root_url "https://github.com/alan-turing-institute/meet/releases/download/v0.2.0.4"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "49229e6f8e3e0f61876e9ff6986adb2ccf8c25916451995a5fc9653f852efef2"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "49229e6f8e3e0f61876e9ff6986adb2ccf8c25916451995a5fc9653f852efef2"
  end

  def install
    system "cabal", "update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end
end

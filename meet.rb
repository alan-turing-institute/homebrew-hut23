class Meet < Formula
  desc "Command-line tool to find meeting times"
  homepage "https://github.com/alan-turing-institute/meet"
  url "https://github.com/alan-turing-institute/meet.git", tag: "v0.2.0.7", revision: "0d2e0cd7c1fe950ad2948da1189082f5a5e90ec5"
  license "MIT"

  depends_on "cabal-install" => :build
  depends_on "ghc@9.10" => :build

  bottle do
    root_url "https://github.com/alan-turing-institute/meet/releases/download/v0.2.0.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c448c7a7fc8c2b6ce6a8e3077b14c8add24aea68096b2750eb01b816551f258a"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "c448c7a7fc8c2b6ce6a8e3077b14c8add24aea68096b2750eb01b816551f258a"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "c448c7a7fc8c2b6ce6a8e3077b14c8add24aea68096b2750eb01b816551f258a"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c448c7a7fc8c2b6ce6a8e3077b14c8add24aea68096b2750eb01b816551f258a"
  end

  def install
    system "cabal", "update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end
end

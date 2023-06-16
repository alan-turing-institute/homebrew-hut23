class Whatwhat < Formula
  desc "`whatwhat` is a command-line tool to report project allocations"
  homepage "https://github.com/alan-turing-institute/whatwhat"
  url "https://github.com/alan-turing-institute/whatwhat.git", tag: "v0.0.18", revision: "e23fcb6bac9d4ef209b6ba3c21c99f9db059b7bf"
  license "MIT"

  depends_on "opam" => :build
  depends_on "openssl@3"

  bottle do
    root_url "https://github.com/alan-turing-institute/whatwhat/releases/tag/v0.0.18"
    rebuild 3
    sha256 cellar: :any, arm64_ventura: "b77b28b6686ad9ea24232278f2001e9b0c419d6ab345ce5f84f077ab9f7ead09"
  end
  
  def install
    opamroot = buildpath/".opam"
    ENV["OPAMROOT"] = opamroot
    ENV["OPAMYES"] = "1"

    ENV.deparallelize
    system "opam", "init", "--no-setup", "--disable-sandboxing"
    system "opam", "install", "dune"
    system "opam", "exec", "--", "make", "install-deps"
    bin.install "_build/default/bin/main.exe" => "whatwhat"
  end

end

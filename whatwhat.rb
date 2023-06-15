class Whatwhat < Formula
  desc "`whatwhat` is a command-line tool to report project allocations"
  homepage "https://github.com/alan-turing-institute/whatwhat"
  url "https://github.com/alan-turing-institute/whatwhat.git", tag: "v0.0.15", revision: "7440e12fcc29db2d9df6be9f4457e51c2b0bb29a"
  license "MIT"

  depends_on "opam" => :build
  depends_on "openssl@3"
  
  bottle do
    root_url "https://github.com/alan-turing-institute/whatwhat/releases/download/v0.0.12"
    rebuild 1
    sha256 cellar: :any, arm64_ventura: "c635f743b2ecf594b679c73bcaa12e32b339261dd0520c563821833f1b2f5a08"
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

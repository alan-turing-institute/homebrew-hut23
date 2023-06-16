class Whatwhat < Formula
  desc "`whatwhat` is a command-line tool to report project allocations"
  homepage "https://github.com/alan-turing-institute/whatwhat"
  url "https://github.com/alan-turing-institute/whatwhat.git", tag: "v0.0.19", revision: "f2b9b0300eff00696b7c57005e539c7082f68450"
  license "MIT"

  depends_on "opam" => :build
  depends_on "openssl@3"
  
  bottle do
    root_url "https://github.com/alan-turing-institute/whatwhat/releases/download/v0.0.18"
    rebuild 3
    sha256 cellar: :any, arm64_ventura: "8c2db9349263513c5237a02d120bbe94b1f52ea3b7caa32025add486dc9805b1"
  end
  
  def install
    opamroot = buildpath/".opam"
    ENV["OPAMROOT"] = opamroot
    ENV["OPAMYES"] = "1"

    ENV.deparallelize
    system "opam", "init", "--no-setup", "--disable-sandboxing"
    system "opam", "install", "dune"
    system "opam", "exec", "--", "make", "install-deps"
    system "mkdir", "-p", "#{ENV["HOME"]}/.config/whatwhat"
    bin.install "_build/default/bin/main.exe" => "whatwhat"
  end

end

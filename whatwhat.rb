class Whatwhat < Formula
  desc "`whatwhat` is a command-line tool to report project allocations"
  homepage "https://github.com/alan-turing-institute/whatwhat"
  url "https://github.com/alan-turing-institute/whatwhat.git", tag: "v0.0.33", revision: "425da6f1bf3053c8f7764ebf0de0257599eb2b00"
  license "MIT"

  depends_on "opam" => :build
  depends_on "openssl@3"

  bottle do
    root_url "https://github.com/alan-turing-institute/whatwhat/releases/download/v0.0.33"
    sha256 cellar: :any, arm64_sequoia: "42658c9b98d54d9dc11429d504c7051f9fc63468a14175c2e3d83bcdd74e7254"
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

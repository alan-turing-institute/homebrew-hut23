class Whatwhat < Formula
  desc "`whatwhat` is a command-line tool to report project allocations"
  homepage "https://github.com/alan-turing-institute/whatwhat"
  url "https://github.com/alan-turing-institute/whatwhat.git", tag: "v0.0.31", revision: "f35cefd766b7c4df7b4b83a3282d99bab434cc39"
  license "MIT"

  depends_on "opam" => :build
  depends_on "openssl@3"

  bottle do
    root_url "https://github.com/alan-turing-institute/whatwhat/releases/download/v0.0.31"
    sha256 cellar: :any, arm64_sequoia: "eeee95ac8cfb71fd6e509c4241fc328500dc5d6989de0116b639c67eab8c86e7"
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

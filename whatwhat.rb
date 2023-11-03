class Whatwhat < Formula
  desc "`whatwhat` is a command-line tool to report project allocations"
  homepage "https://github.com/alan-turing-institute/whatwhat"
  url "https://github.com/alan-turing-institute/whatwhat.git", tag: "v0.0.20", revision: "21fd080e44db37c7594e375ba878507c10a89a68"
  license "MIT"

  depends_on "opam" => :build
  depends_on "openssl@3"
  
  bottle do
    sha256 cellar: :any, arm64_ventura: "3059c3bc6c4c07ce94066253c02b7e294e0bbd41aed045395f6e8db9936f6184"
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

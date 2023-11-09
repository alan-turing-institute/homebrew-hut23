class Whatwhat < Formula
  desc "`whatwhat` is a command-line tool to report project allocations"
  homepage "https://github.com/alan-turing-institute/whatwhat"
  url "https://github.com/alan-turing-institute/whatwhat.git", tag: "v0.0.20", revision: "8383336c034a6e6bdfe61e5a36f66b85aa4993ac"
  license "MIT"

  depends_on "opam" => :build
  depends_on "openssl@3"
  
  bottle do
    root_url "https://github.com/alan-turing-institute/whatwhat/releases/download/v0.0.20"
    sha256 cellar: :any, arm64_ventura: "3059c3bc6c4c07ce94066253c02b7e294e0bbd41aed045395f6e8db9936f6184"
    sha256 cellar: :any, sonoma: "aaaaf7edf2cd10d1ba4746de0741efb924351430693459132a77925fed8c9aee"
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

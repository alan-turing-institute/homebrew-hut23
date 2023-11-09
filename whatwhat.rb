class Whatwhat < Formula
  desc "`whatwhat` is a command-line tool to report project allocations"
  homepage "https://github.com/alan-turing-institute/whatwhat"
  url "https://github.com/alan-turing-institute/whatwhat.git", tag: "v0.0.26", revision: "692fa6d234acaa32e57b3c958bbf6ec66374f7d6"
  license "MIT"

  depends_on "opam" => :build
  depends_on "openssl@3"
  
==> Bottling whatwhat--0.0.26.arm64_ventura.bottle.tar.gz...
    root_url "https://github.com/alan-turing-institute/whatwhat/releases/download/v0.0.26"
==> Detecting if whatwhat--0.0.26.arm64_ventura.bottle.tar.gz is relocatable...
./whatwhat--0.0.26.arm64_ventura.bottle.tar.gz
  bottle do
    sha256 cellar: :any, arm64_ventura: "2469acebd9e6a965e785cbdb3758ef6f64d835f18be5b46213fe1fcfad8989aa"
  end

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

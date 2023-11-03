class Whatwhat < Formula
  desc "`whatwhat` is a command-line tool to report project allocations"
  homepage "https://github.com/alan-turing-institute/whatwhat"
  url "https://github.com/alan-turing-institute/whatwhat.git", tag: "v0.0.20", revision: "21fd080e44db37c7594e375ba878507c10a89a68"
  license "MIT"

  depends_on "opam" => :build
  depends_on "openssl@3"
  
  # specify precompiled bottle for faster installation
  bottle do
    root_url "https://github.com/alan-turing-institute/whatwhat/releases/download/v0.0.19"
    rebuild 4
    sha256 cellar: :any, arm64_ventura: "c458c07d0e9790b0a42f2bf548b80193b7fdd1434fd895a7202ccd829012280d"
    sha256 cellar: :any, ventura: "1b6f67a2e98a7e4d325fe101bdaaf44f4b32f4f7b5dda395a9f2b1325ed8883e"
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

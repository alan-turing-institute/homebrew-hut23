class Whatwhat < Formula
  desc "`whatwhat` is a command-line tool to report project allocations"
  homepage "https://github.com/alan-turing-institute/whatwhat"
  url "https://github.com/alan-turing-institute/whatwhat.git", tag: "v0.0.5", revision: "a105962660db2e81dc66eb9f72cc47be70a9fac1"
  license "MIT"

  depends_on "opam" => :build
  depends_on "openssl@3"
  
  bottle do
    root_url "https://github.com/alan-turing-institute/whatwhat/releases/download/v0.0.5"
    rebuild 2
    sha256 cellar: :any, arm64_ventura: "7e4420e5d9d5a6123984d651e6e9958282a97aaa9cccda9e809d33d2d7fcdbc6"
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

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test whatwhat`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end

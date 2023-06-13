class Whatwhats < Formula
  desc "`whatwhat` is an OCaml command-line tool to help monitor project status and allocations in the Research Engineering Group"
  homepage "https://github.com/alan-turing-institute/whatwhat"
  url "https://github.com/alan-turing-institute/whatwhat/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "53d9ad7669641c6964034a46647e297cd740b31ac8bbcd5acab7745455cd3385"
  license "MIT"

  $opam_switch = "whatwhat-homebrew"

  depends_on "opam" => :build

  def install
    system "opam", "init", "-y"
    system "opam", "switch", "create", $opam_switch, "5.0.0", "-y"
    system "opam", "switch", "set", $opam_switch, "-y"
    system "opam", "install", "dune", "-y"
    system "opam", "exec", "--switch", $opam_switch, "--", "dune", "build"
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
    system "false"
  end
end

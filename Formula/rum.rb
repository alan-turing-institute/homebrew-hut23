# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

# THIS IS VERY MUCH THE WRONG WAY TO DO THINGS

# The current formula downloads and compiles rum but compilation will only
# succeed on a system with Racket and the appropriate libraries already
# installed. I have been unable to figure out how to manage Racket libraries
# with homebrew, because Racket has its own package manager that doesn't play
# nicely with homebrew's ideas.

class Rum < Formula
  desc "Turing Institute meeting room availability checker"
  homepage "https://github.com/alan-turing-institute/rum"
  url "https://github.com/alan-turing-institute/rum/archive/0.2.1.tar.gz"
  sha256 "8a31d012416a873ad685e3c686c28c32e8ae0d41d57559c5ad51eb977d80726d"

  bottle do
    root_url "https://github.com/alan-turing-institute/rum/releases/download/0.2.1"
    sha256 "642f764d52488a8b69faf8694fd659bd0586fc81f35f5e390fb4dd5577dd06b5" => :mojave
  end
   
  depends_on "racket"
  
  def install
    system "make --ignore-errors"   # I KNOW, I KNOW!
    bin.install "dist/bin/rum"
    prefix.install Dir["dist/bin"]
    prefix.install Dir["dist/lib"]
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # system "./configure", "--disable-debug",
    #                      "--disable-dependency-tracking",
    #                      "--disable-silent-rules",
    #                      "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    # system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test rum`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end

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
  url "https://github.com/alan-turing-institute/rum/archive/0.2.0.tar.gz"
  sha256 "e47bf48ad5103c8fa35375a2e7b41e7da1a79db63a6bc67ebd016a04c02f0223"

  bottle do
    root_url "https://github.com/alan-turing-institute/rum/releases/download/0.2.0"
    sha256 "b7f0b297e82dae3e8c8f0c9af484e6d2c7d92cad230a9183d383472165cb4ef3" => :mojave
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

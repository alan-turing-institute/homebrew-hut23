# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

# THIS IS VERY MUCH THE WRONG WAY TO DO THINGS
# I OUGHT TO COMPILE (AND MAKE A BOTTLE IF I NEED TO)
# THIS DOWNLOADS AND INSTALLS A BINARY!

class Rum < Formula
  desc "Turing Institute meeting room availability checker"
  homepage "https://github.com/alan-turing-institute/rum"
  url "https://github.com/alan-turing-institute/rum/blob/dist/dist/rum-0.1.0.tar.gz?raw=true"
  sha256 "9570aaa929bf711a92522c9cbe63c4840185f3c3b1d869177e5169cac9255f78"
  revision 7
  
  def install
    bin.install "bin/rum"
    prefix.install Dir["bin"]
    prefix.install Dir["lib"]
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

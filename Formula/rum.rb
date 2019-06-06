# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula

class Rum < Formula
  desc "Turing Institute meeting room availability checker"
  homepage "https://github.com/alan-turing-institute/rum"
  url "https://github.com/alan-turing-institute/rum/blob/dist/dist/rum-0.1.0.tar.gz?raw=true"
  sha256 "f72199108d02d181a351fd2ad7005d49281b8cfbbacf5d11608502734249ddb0"
  revision 2
  
  def install
    bin.install "rum/bin/rum"
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # system "./configure", "--disable-debug",
    #                      "--disable-dependency-tracking",
    #                      "--disable-silent-rules",
    #                      "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    #system "make", "install" # if this fails, try separate make/make install steps
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

class Stderred < Formula
  desc "Stderr in red"
  homepage "https://github.com/sickill/stderred"
  url "https://github.com/sickill/stderred.git"
  version "HEAD"

  depends_on "cmake" => :build

  def install
    system "make install"
    if OS.mac?
      lib.install "build/libstderred.dylib"
      bin.install_symlink lib/"libstderred.dylib"
    elsif OS.linux?
      lib.install "build/libstderred.so"
      bin.install_symlink lib/"libstderred.so"
    end
  end

  def caveats
    <<~EOS
      To use stderred export the following before running a command
        export DYLD_INSERT_LIBRARIES="#{HOMEBREW_PREFIX}/lib/libstderred.dylib${DYLD_INSERT_LIBRARIES:+:DYLD_INSERT_LIBRARIES}"
    EOS
  end
end

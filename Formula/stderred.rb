class Stderred < Formula
  desc "Stderr in red"
  homepage "https://github.com/nobu-g/stderred"
  url "https://github.com/nobu-g/stderred.git"
  version "1.1"
  license ""

  depends_on "cmake" => :build

  def install
    system "make"
    if OS.mac?
      lib.install "build/libstderred.dylib"
    elsif OS.linux?
      lib.install "build/libstderred.so"
    end
  end

  def caveats
    <<~EOS
      To use stderred export the following before running a command
        export DYLD_INSERT_LIBRARIES="#{HOMEBREW_PREFIX}/lib/libstderred.dylib${DYLD_INSERT_LIBRARIES:+:DYLD_INSERT_LIBRARIES}"
    EOS
  end
end

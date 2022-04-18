class Stderred < Formula
  desc "Stderr in red"
  homepage "https://github.com/sickill/stderred"
  url "https://github.com/sickill/stderred.git"
  version "HEAD"

  depends_on "cmake" => :build

  def install
    system "make"
    if OS.mac?
      lib.install "build/libstderred.dylib"
    elsif OS.linux?
      lib.install "build/libstderred.so"
    end
    # system "echo", "This is stderred dummy executable to avoid empty installation error" > "stderred.dummy"
    touch "stderred.dummy"
    inreplace "stderred.dummy", "", 'echo "This is a dummy executable for stderred to avoid empty installation error"'
    chmod 0755, "stderred.dummy"
    # system "chmod", "755", "stderred.dummy"
    bin.install "stderred.dummy"  # TODO: create some binary
    system "false"
  end

  def caveats
    <<~EOS
      To use stderred export the following before running a command
        export DYLD_INSERT_LIBRARIES="#{HOMEBREW_PREFIX}/lib/libstderred.dylib${DYLD_INSERT_LIBRARIES:+:DYLD_INSERT_LIBRARIES}"
    EOS
  end
end

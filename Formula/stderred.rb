require 'formula'

class Stderred < Formula
  homepage 'https://github.com/sickill/stderred'
  url 'https://github.com/sickill/stderred.git'
  version 'HEAD'

  depends_on "cmake" => :build

  def install
    mkdir 'build' do
      system 'make'
    end
  end

  def caveats; <<~EOS
      To use stderred export the following before running a command
          export DYLD_INSERT_LIBRARIES="#{HOMEBREW_PREFIX}/lib/libstderred.dylib${DYLD_INSERT_LIBRARIES:+:DYLD_INSERT_LIBRARIES}"
    EOS
  end
end

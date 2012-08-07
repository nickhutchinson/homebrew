require 'formula'

class Smc < Formula
  homepage 'http://smc.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/smc/smc/6_1_0/smc_6_1_0.tgz'
  sha1 '72e55ed6b47ceca346867ac36be4f2651641c6b0'

  def install
    libexec.install ["bin"]
    
    (bin+'smc').write <<-EOS.undent
      #!/bin/sh
      java -jar "#{libexec}/bin/Smc.jar" "$@"
    EOS

    doc.install Dir["docs/*"]
    (share+'smc').install ["examples/", "tools/", "lib/"]
  end

  def caveats; <<-EOS.undent
    SMC class definitions can be found in:
    #{HOMEBREW_PREFIX}/share/smc/lib/
    EOS
  end

  def test
    system "#{bin}/smc", "-version"
  end
end

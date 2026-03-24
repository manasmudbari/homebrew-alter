# Homebrew formula for alter — a process manager for developers
# Hosted in the tap repository: https://github.com/thechandanbhagat/homebrew-alter
#
# Install via:
#   brew tap thechandanbhagat/alter
#   brew install alter
#
# Or (once submitted to homebrew-core):
#   brew install alter-pm

class Alter < Formula
  desc "A process manager for developers — run and manage any application"
  homepage "https://github.com/manasmudbari/alter-pm"
  version "0.7.0-macos-test"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/manasmudbari/alter-pm/releases/download/v#{version}/alter-#{version}-macos-x86_64.tar.gz"
      sha256 "7412a9eeea48c1821b4eb2a180aba17bba595c2f518d8856b952354252895a28"
    end

    on_arm do
      url "https://github.com/manasmudbari/alter-pm/releases/download/v#{version}/alter-#{version}-macos-arm64.tar.gz"
      sha256 "db65c286ed05c5b73c87c45a20815e043c8e9b446130995d2ef2fca8eeab79a0"
    end
  end

  def install
    bin.install "alter"
  end

  def caveats
    <<~EOS
      To start the alter daemon:
        alter daemon start

      To auto-start the daemon on login (sets up a launchd LaunchAgent):
        alter startup

      Web UI is accessible at http://localhost:1337 when the daemon is running.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/alter --version")
  end
end

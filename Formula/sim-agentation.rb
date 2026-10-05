class SimAgentation < Formula
  desc "Annotate a running iOS simulator in the browser and hand the notes to agents"
  homepage "https://github.com/lcandy2/sim-agentation"
  url "https://github.com/lcandy2/sim-agentation/releases/download/0.2.0/sim-agentation-0.2.0-macos-arm64.tar.gz"
  sha256 "3189c582a6335e247c04ce9588e8a2a648341a119ecf7c2cdd1ba4b810d18ead"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    # The binary finds web/ by walking up from itself, and the iPhone Duo
    # helper's sources in host/Guest beside it, so the tree stays whole.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/sim-agentation"
  end

  service do
    run [opt_bin/"sim-agentation", "serve"]
    keep_alive true
    log_path var/"log/sim-agentation.log"
    error_log_path var/"log/sim-agentation.log"
  end

  def caveats
    <<~EOS
      SimAgentation drives simulators through Xcode, so it needs Xcode 26 or later
      (27.1 for iPhone Duo).

      Open the UI with:
        sim-agentation serve --open

      Connect an agent with the Claude Code or Codex plugin (see the README), or:
        claude mcp add sim-agentation -- #{opt_bin}/sim-agentation mcp
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/sim-agentation version").strip
  end
end

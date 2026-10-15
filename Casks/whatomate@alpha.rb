cask "whatomate@alpha" do
  version "1.0.0-a1"

  on_macos do
    sha256 "93f7d48c9fb17abee46adcda66739c5683977c131a3884298712fa0e5334ac34"

    url "https://github.com/trysoft-team/whatomate/releases/download/v#{version}/whatomate_#{version}_darwin_universal.tar.gz"
  end
  on_linux do
    on_arm do
      sha256 "48ef1114597bbe6f50fd66a63aa9bfec2081f56fafb5b09bd63da5686c81ae2b"
      url "https://github.com/trysoft-team/whatomate/releases/download/v#{version}/whatomate_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "70252378fb00d2a22def4d47c1e56d761746d8c88e5595239d4493727804682a"
      url "https://github.com/trysoft-team/whatomate/releases/download/v#{version}/whatomate_#{version}_linux_amd64.tar.gz"
    end
  end

  name "whatomate (alpha)"
  desc "Pre-release of the self-hosted WhatsApp Business platform"
  homepage "https://github.com/trysoft-team/whatomate"

  livecheck do
    skip "Updated by hand for pre-releases."
  end

  conflicts_with cask: "whatomate"
  depends_on formula: [
    "ffmpeg",
    "opus-tools",
  ]

  binary "whatomate"

  # No zap stanza required

  caveats <<~EOS
    This is a pre-release. For the stable version: brew install trysoft-team/tap/whatomate

    Start whatomate and finish setup in your browser:
      whatomate
    It opens http://localhost:4747 and asks which database to use
    (SQLite needs nothing else installed). The config is saved to
    #{HOMEBREW_PREFIX}/etc/whatomate/config.toml on macOS
    (~/.config/whatomate/config.toml on Linux).
    Until setup is finished, anyone who can reach this port can complete it.

    Redis is optional: set [redis] host in config.toml to use one.

    This build is not notarized. If macOS blocks it, run:
      xattr -dr com.apple.quarantine "#{staged_path}/whatomate"
  EOS
end

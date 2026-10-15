cask "whatomate@alpha" do
  version "1.0.0-a2"

  on_macos do
    sha256 "e3aa2f598b01d0c46a0046e25f9a652aa47a1d09693fb1711a278ffda8b64044"

    url "https://github.com/trysoft-team/whatomate/releases/download/v#{version}/whatomate_#{version}_darwin_universal.tar.gz"
  end
  on_linux do
    on_arm do
      sha256 "c8bdee10fc4d8f3115e49323b42b47e12148b626130b550ad3478f89fce4a566"
      url "https://github.com/trysoft-team/whatomate/releases/download/v#{version}/whatomate_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "4772514ae7e9e1e5b4b30137c733a2e3accf1f9dd0bbe5e8f3b575d27873deea"
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

class Cryptkeeper < Formula
  desc "Direnv for encrypted secrets"
  homepage "https://github.com/sunny-b/cryptkeeper"

  v = "v0.1.1" # CI Managed
  url "https://api.github.com/repos/sunny-b/cryptkeeper/tarball/v0.1.1"
  sha256 "71c082eea4809ab71a9ec5d91e4332d0f5b6039c3a7fc5cba59f6b5037580be6"
  head "https://github.com/sunny-b/cryptkeeper.git"
  version v

  depends_on "go" => :build

  def install
    system "go", "env" # Debug env
    system "make", "build"
    bin.install "bin/cryptkeeper"

    prefix.install_metafiles
  end

  test do
    system "#{bin}/cryptkeeper", "version"
  end
end
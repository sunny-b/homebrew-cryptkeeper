class Cryptkeeper < Formula
  desc "Direnv for encrypted secrets"
  homepage "https://github.com/sunny-b/cryptkeeper"

  v = "v0.0.0" # CI Managed
  url "https://github.com/sunny-b/cryptkeeper/archive/refs/tags/latest.tar.gz"
  sha256 "TheActualSHA256OfTheLatestTarball"
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
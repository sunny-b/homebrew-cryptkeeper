class Cryptkeeper < Formula
  desc "Direnv for encrypted secrets"
  homepage "https://github.com/sunny-b/cryptkeeper"

  v = "v0.1.0" # CI Managed
  url "https://api.github.com/repos/sunny-b/cryptkeeper/tarball/v0.1.0"
  sha256 "08a40434fa6bf2bf51224d42a7b872b33fb3c1f6b9c38f5ab92efad8618f5c23"
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
class Cryptkeeper < Formula
  desc "Direnv for encrypted secrets"
  homepage "https://github.com/sunny-b/cryptkeeper"

  v = "" # CI Managed
  url ""
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
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
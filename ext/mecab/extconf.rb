require 'open-uri'
require 'digest/md5'
require 'fileutils'

def version
  version_file = "VERSION"
  open(version_file) {|io| io.read }.chomp
end

URL = "http://downloads.sourceforge.net/project/mecab/mecab-ruby/0.98/mecab-ruby-#{version}.tar.gz"
MD5 = 'd486f70f30cbaf2cf5fbbc17eb268371'

def download
  open(URL) do |src|
    open("mecab-ruby.tar.gz", "wb") do |dst|
      dst.write src.read
    end
  end
end

def checksum
  s = open("mecab-ruby.tar.gz") {|io| io.read }
  d = Digest::MD5.hexdigest(s)
  d == MD5
end

def extract
  system("tar xzf mecab-ruby.tar.gz")
end

def relocate
  dir = "mecab-ruby-#{version}"
  Dir.chdir(dir) do
    list = Dir.glob("*") - %w[extconf.rb]
    FileUtils.cp(list, "..")
  end
end

download

checksum or begin
  $stderr.puts "md5 unmatched"
  exit 1
end

extract

relocate

load "mecab-ruby-#{version}/extconf.rb"

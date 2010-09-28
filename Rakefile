require 'rake/extensiontask'

PACKAGE_NAME = 'mecab'

def version
  version_file = "ext/#{PACKAGE_NAME}/VERSION"
  open(version_file) {|io| io.read }.chomp
end

spec = Gem::Specification.new do |s|
  s.name = PACKAGE_NAME
  s.summary = "Ruby/Mecab"
  s.description = "Ruby/Mecab is a Ruby binding of mecab"
  s.author = "Mecab Developers"
  s.email = ""
  s.homepage = "http://mecab.sourceforge.net/"
  s.version = version
  s.platform = Gem::Platform::RUBY
  s.extensions = FileList["ext/#{PACKAGE_NAME}/extconf.rb"]
  s.files = FileList["ext/**/*"]
end

Rake::GemPackageTask.new(spec) do |pkg|
end

Rake::ExtensionTask.new(PACKAGE_NAME, spec) do |ext|
end

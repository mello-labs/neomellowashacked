# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "hacked-terminal"
  spec.version       = "3.1.0"
  spec.authors       = ["piazzai"]
  spec.email         = ["42124135+piazzai@users.noreply.github.com"]

  spec.summary       = "Jekyll microtheme that looks like JSON"
  spec.homepage      = "https://github.com/piazzai/hacked-jekyll"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{assets,_data,_layouts,_includes,_sass,LICENSE,README,_config.yml}/**/*").select { |f| File.file?(f) }
  spec.files        += ["LICENSE", "README.md", "_config.yml"]
  spec.files         = spec.files.uniq

  spec.add_runtime_dependency "jekyll", "~> 4.3"
  spec.add_runtime_dependency "jekyll-seo-tag"
  spec.add_runtime_dependency "jekyll-sitemap"
end

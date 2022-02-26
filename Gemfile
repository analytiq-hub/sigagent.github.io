# frozen_string_literal: true

source "https://rubygems.org"
gemspec


#gem "jekyll", ENV["JEKYLL_VERSION"] if ENV["JEKYLL_VERSION"]
gem "github-pages", group: :jekyll_plugins

# If you have any plugins, put them here!
group :jekyll_plugins do
  gem "kramdown-parser-gfm" if ENV["JEKYLL_VERSION"] == "~> 3.9"
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-pdf-embed", "1.1.2.1" # Per example at https://github.com/MihajloNesic/minimal-mistakes-pdf-example/
end

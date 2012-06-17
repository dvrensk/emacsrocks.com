require "./lib/episodes"

Episodes.all_normal.each do |episode|
  page "/e#{episode.number}.html", :proxy => "/episode.html", :ignore => true do
    @episode = episode
  end
end

Episodes.all_extending.each do |episode|
  page "/extend/e#{episode.number}.html", :proxy => "/extending-episode.html", :ignore => true do
    @episode = episode
  end
end

page "/", :proxy => "/episodes.html", :ignore => true

require "./lib/atom"

page "/atom.xml", :proxy => "/atom.xml", :layout => "none" do
  @feed = Atom.build
end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

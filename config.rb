###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

# These are proxy pages for each design type
data.designs.each do |design|
  case design.template


  when "iphone4s"
    proxy "/design/#{design.slug}.html", "/devices/iphone4s.html", :layout => false, :locals => { :slug => design['slug'], :name => design['name'], :color => design['color'], :orientation => design['orientation'] }, :ignore => true
  when "iphone5s"
    proxy "/design/#{design.slug}.html", "/devices/iphone5s.html", :layout => false, :locals => { :slug => design['slug'], :name => design['name'], :color => design['color'], :orientation => design['orientation'] }, :ignore => true
  when "iphone5c"
    proxy "/design/#{design.slug}.html", "/devices/iphone5c.html", :layout => false, :locals => { :slug => design['slug'], :name => design['name'], :color => design['color'], :orientation => design['orientation'] }, :ignore => true
  when "iphone6"
    proxy "/design/#{design.slug}.html", "/devices/iphone6.html", :layout => false, :locals => { :slug => design['slug'], :name => design['name'], :color => design['color'], :orientation => design['orientation'] }, :ignore => true
  when "iphone6plus"
    proxy "/design/#{design.slug}.html", "/devices/iphone6plus.html", :layout => false, :locals => { :slug => design['slug'], :name => design['name'], :color => design['color'], :orientation => design['orientation'] }, :ignore => true
  when "nexus5"
    proxy "/design/#{design.slug}.html", "/devices/nexus5.html", :layout => false, :locals => { :slug => design['slug'], :name => design['name'], :color => design['color'], :orientation => design['orientation'] }, :ignore => true
  when "ipad"
    proxy "/design/#{design.slug}.html", "/devices/ipad.html", :layout => false, :locals => { :slug => design['slug'], :name => design['name'], :color => design['color'], :orientation => design['orientation'] }, :ignore => true
  when "full"
    proxy "/design/#{design.slug}.html", "/devices/full.html", :layout => false, :locals => { :slug => design['slug'], :name => design['name'], :color => design['color'], :orientation => design['orientation'] }, :ignore => true
  when "full-center"
    proxy "/design/#{design.slug}.html", "/devices/full-center.html", :layout => false, :locals => { :slug => design['slug'], :name => design['name'], :color => design['color'], :orientation => design['orientation'] }, :ignore => true
  end
end

###
# Helpers
###

# Class for the image's information, used in the image_size helper
class FileInfo
  attr_accessor :width
  attr_accessor :height

  def initialize(width, height)
    @width = width
    @height = height
  end
end

helpers do
  # Image size detection for comp pages
  def image_size(file)
    require 'rmagick'

    # Define the path to the comps directory
    # Use File.expand_path to get the absoltue path to the directory
    image_path = File.expand_path("source/images/comps/#{file}.jpg")

    image = Magick::Image.read(File.open(image_path)).first
    width = image.columns
    height = image.rows

    image_info = FileInfo.new(width, height)

    return image_info
  end
end

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :fonts_dir, 'fonts'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

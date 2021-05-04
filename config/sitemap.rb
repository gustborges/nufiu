require 'rubygems'
require 'sitemap_generator'

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'https://www.nufiu.com.br'

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/'
  add root_path, priority: 0.7, changefreq: 'daily'

  # Add static pages
  add sobre_path, priority: 0.5, changefreq: 'weekly'
  add privacidade_path, priority: 0.5, changefreq: 'weekly'
  add faq_path, priority: 0.5, changefreq: 'weekly'
  add entregas_path, priority: 0.5, changefreq: 'weekly'
  add workshop_path, priority: 0.5, changefreq: 'weekly'
  add pagamento_path, priority: 0.5, changefreq: 'weekly'
  add new_contact_path, priority: 0.5, changefreq: 'weekly'

  # Add each plants:
  Plant.all.each do |plant|
    add plant_path(plant), lastmod: plant.updated_at
  end
end

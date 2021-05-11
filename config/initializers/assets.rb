# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w[components/_card.css components/_banner.css
#                                                  pages/_main.css components/_alert.css components/_breadcrumb.css components/_facet.css components/_form.css pages/_cart.css pages/_payment.css pages/_show.css pages/_static_pages.css pages/_thanks.css]

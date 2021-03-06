# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
# Rails.application.config.assets.precompile += %w( static_pages.js )
# Rails.application.config.assets.precompile += %w( static_pages.scss )
%w( users static_pages sessions organizations farmers labourers farms users account_activations ).each do |controller|
	# Rails.application.config.assets.precompile += %w( static_pages.js )
	# Rails.application.config.assets.precompile += %w( static_pages.scss )
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.scss"]
end

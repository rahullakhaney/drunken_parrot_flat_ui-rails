require 'rails/generators'
require 'pathname'

module Drunken
	module Generators
		class DemoGenerator < Rails::Generators::Base
			desc "This generator will setup Drunken Parrot Flat UI Demo page."
			source_root File.expand_path("../../../../../app/assets/demo/drunken-parrot/", __FILE__)

			# Detect if Drunken Parrot flat ui assets copied over to gem
			def check_drunkenparrotflatui_install
				unless File.exist?(File.expand_path("../../../../../app/assets", __FILE__))
					raise "Please run install generator first"
				end
			end

			def generate_demo_controller
				generate "controller drunkenparrotflatui_demo index documentation start-here --no-helper --no-test-framework --no-assets"
			end

			def add_demo_assets
				gem_assets_dir = File.expand_path("../../../../../app/assets", __FILE__)				

				copy_file "index.html.erb", "app/views/drunkenparrotflatui_demo/index.html.erb"
				copy_file "../templates/index.js", File.join(gem_assets_dir, "javascripts", "drunken-parrot", "index.js")
				copy_file "../templates/index.css", File.join(gem_assets_dir, "stylesheets", "drunken-parrot", "index.css")
				copy_file "../templates/index.html.erb", "app/views/layouts/index.html.erb"

				copy_file "start-here.html.erb", "app/views/drunkenparrotflatui_demo/start-here.html.erb"
				copy_file "../templates/start-here.js", File.join(gem_assets_dir, "javascripts", "drunken-parrot", "start-here.js")
				copy_file "../templates/start-here.css", File.join(gem_assets_dir, "stylesheets", "drunken-parrot", "start-here.css")
				copy_file "../templates/start-here.html.erb", "app/views/layouts/start-here.html.erb"

				copy_file "documentation.html.erb", "app/views/drunkenparrotflatui_demo/documentation.html.erb"				
				copy_file "../templates/documentation.js", File.join(gem_assets_dir, "javascripts", "drunken-parrot", "documentation.js")
				copy_file "../templates/documentation.css", File.join(gem_assets_dir, "stylesheets", "drunken-parrot", "documentation.css")
				copy_file "../templates/documentation.html.erb", "app/views/layouts/documentation.html.erb"

				copy_file "../templates/drunkenparrotflatui_demo_controller.rb", "app/controllers/drunkenparrotflatui_demo_controller.rb"

				gsub_file 'config/initializers/assets.rb', /^Rails\.application\.config\.assets\.precompile\s+.+/ do |match|
					"Rails.application.config.assets.precompile += %w( index.css index.js documentation.css documentation.js start-here.css start-here.js )"
				end
			end
		end
	end
end
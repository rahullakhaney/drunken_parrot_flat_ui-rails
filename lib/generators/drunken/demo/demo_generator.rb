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
				generate "controller drunkenparrotflatui_demo index documentation start_here --no-helper --no-test-framework --no-assets"
			end

			def add_demo_assets
				gem_assets_dir = File.expand_path("../../../../../app/assets", __FILE__)
				demo_templates_dir = File.expand_path("../../../../../lib/generators/drunken/demo/templates", __FILE__)

				copy_file "index.html.erb", "app/views/drunkenparrotflatui_demo/index.html.erb"
				copy_file File.join(demo_templates_dir, "index.js"), File.join(gem_assets_dir, "javascripts", "drunken-parrot", "index.js")
				copy_file File.join(demo_templates_dir, "index.css"), File.join(gem_assets_dir, "stylesheets", "drunken-parrot", "index.css")
				copy_file File.join(demo_templates_dir, "index.html.erb"), "app/views/layouts/index.html.erb"

				copy_file "start_here.html.erb", "app/views/drunkenparrotflatui_demo/start_here.html.erb"
				copy_file File.join(demo_templates_dir, "start_here.js"), File.join(gem_assets_dir, "javascripts", "drunken-parrot", "start_here.js")
				copy_file File.join(demo_templates_dir, "start_here.css"), File.join(gem_assets_dir, "stylesheets", "drunken-parrot", "start_here.css")
				copy_file File.join(demo_templates_dir, "start_here.html.erb"), "app/views/layouts/start_here.html.erb"

				copy_file "documentation.html.erb", "app/views/drunkenparrotflatui_demo/documentation.html.erb"				
				copy_file File.join(demo_templates_dir, "documentation.js"), File.join(gem_assets_dir, "javascripts", "drunken-parrot", "documentation.js")
				copy_file File.join(demo_templates_dir, "documentation.css"), File.join(gem_assets_dir, "stylesheets", "drunken-parrot", "documentation.css")
				copy_file File.join(demo_templates_dir, "documentation.html.erb"), "app/views/layouts/documentation.html.erb"

				copy_file File.join(demo_templates_dir, "drunkenparrotflatui_demo_controller.rb"), "app/controllers/drunkenparrotflatui_demo_controller.rb"

				gsub_file 'config/initializers/assets.rb', /^Rails\.application\.config\.assets\.precompile\s+.+/ do |match|
					"Rails.application.config.assets.precompile += %w( index.css index.js documentation.css documentation.js start_here.css start_here.js )"
				end

				assets_file = 'config/initializers/assets.rb'
				content = File.read(assets_file)

		        unless content.match(/^Rails\.application\.config\.assets\.precompile\s+.+/)
            		insert_into_file assets_file, "Rails.application.config.assets.precompile += %w( index.css index.js documentation.css documentation.js start_here.css start_here.js )", :after => "# Rails.application.config.assets.precompile += %w( search.js )\n"
          		end				
			end
		end
	end
end
require 'rails/generators/base'
require 'pathname'

module DrunkenParrotFlatUi
	module Generators
		class InstallGenerator < Rails::Generators::Base
			desc "This generator will copies licensed Drunken Parrot Flat UI files to drunken_parrot_flat_ui-rails gem."			
			argument :drunkenparrotflatui_dir, :type => :string, :banner => "<Licensed Drunken Parrot Flat UI directory>"
			source_root File.expand_path("../templates", __FILE__)

			def copy_assets
				gem_assets_dir = File.expand_path("../../../../../app/assets", __FILE__)
				premium_dir = drunkenparrotflatui_dir

				unless File.exist?(File.join(premium_dir, "index.html"))
	          		premium_dir = File.join(premium_dir, "UI HTMLs")
	        	end

				unless File.directory?(File.join(premium_dir, "fonts", "ss-junior"))
	          		raise "Invalid Drunken Parrot Flat UI Premium directory"
	        	end
	        	
	        	directory File.join(premium_dir, "fonts"), File.join(gem_assets_dir, "fonts", "drunken-parrot")
	        	directory File.join(premium_dir, "images"), File.join(gem_assets_dir, "images", "drunken-parrot")
	        	directory File.join(premium_dir, "js"), File.join(gem_assets_dir, "javascripts", "drunken-parrot")
	        	directory File.join(premium_dir, "less"), File.join(gem_assets_dir, "less", "drunken-parrot")
	        	directory File.join(premium_dir, "css"), File.join(gem_assets_dir, "stylesheets", "drunken-parrot")

	        	# Demo page assets
	        	copy_file File.join(premium_dir, "bootstrap", "css", "prettify.css"), File.join(gem_assets_dir, "demo", "drunken-parrot", "prettify.css")
	        	copy_file File.join(premium_dir, "bootstrap", "js", "prettify.js"), File.join(gem_assets_dir, "demo", "drunken-parrot", "prettify.js")
	        	copy_file File.join(premium_dir, "documentation.html"), File.join(gem_assets_dir, "demo", "drunken-parrot", "documentation.html")
	        	copy_file File.join(premium_dir, "index.html"), File.join(gem_assets_dir, "demo", "drunken-parrot", "index.html")
	        	copy_file File.join(premium_dir, "start-here.html"), File.join(gem_assets_dir, "demo", "drunken-parrot", "start-here.html")
			end

			def add_assets
				copy_file "drunken-parrot.js", "app/assets/javascripts/drunken-parrot/drunken-parrot.js"

		        # Handle JS Manifest
		        js_manifest = "app/assets/javascripts/application.js"

		        if File.exist?(js_manifest)
		        	content = File.read(js_manifest)
		        	unless content.match(/require\s+drunken-parrot\/drunken-parrot/)
            			insert_into_file js_manifest, "//= require drunken-parrot/drunken-parrot\n", :after => "jquery\n"
          			end
		        else
		        	copy_file "application.js", js_manifest
		        end

		        # Handle CSS Manifest
		        css_manifest = "app/assets/stylesheets/application.css"

		        if File.exist?(css_manifest)
		        	content = File.read(css_manifest)
		        	unless content.match(/require_tree\s+\./)
		        		style_require_block = " *= require drunken-parrot/drunken-parrot\n *= require drunken-parrot/demo\n"
		        		insert_into_file css_manifest, style_require_block, :after => "require_self\n"
		        	end
		        else
		        	copy_file "application.css", css_manifest
		        end
			end

			def patch_assets
				gem_assets_dir = File.expand_path("../../../../../app/assets", __FILE__)

				# LESS patches
				# merriweather.less
				gsub_file File.join(gem_assets_dir, "less", "drunken-parrot", "fonts", "merriweather.less"), /..\/fonts\//, ""

				# source-sans.less
				gsub_file File.join(gem_assets_dir, "less", "drunken-parrot", "fonts", "source-sans.less"), /..\/fonts\//, ""

				# icons.less
				gsub_file File.join(gem_assets_dir, "less", "drunken-parrot", "modules", "icons.less"), /..\/fonts\//, ""

				# demo.less
				gsub_file File.join(gem_assets_dir, "less", "drunken-parrot", "demo.less"), /..\/fonts\//, ""

				# variables.less
				gsub_file File.join(gem_assets_dir, "less", "drunken-parrot", "variables.less"), /..\/images\//, ""

				# CSS patches
				# demo.css
				gsub_file File.join(gem_assets_dir, "stylesheets", "drunken-parrot", "demo.css"), /..\/fonts\//, ""

				# drunken-parrot-merriweather.css
				gsub_file File.join(gem_assets_dir, "stylesheets", "drunken-parrot", "drunken-parrot-merriweather.css"), /..\/fonts\//, ""				
				gsub_file File.join(gem_assets_dir, "stylesheets", "drunken-parrot", "drunken-parrot-merriweather.css"), /..\/images\//, ""				

				# drunken-parrot.css
				gsub_file File.join(gem_assets_dir, "stylesheets", "drunken-parrot", "drunken-parrot.css"), /..\/fonts\//, ""				
				gsub_file File.join(gem_assets_dir, "stylesheets", "drunken-parrot", "drunken-parrot.css"), /..\/images\//, ""				
			
				# DEMO HTML patches
				# documentation.html
				documentation_file = File.join(gem_assets_dir, "demo", "drunken-parrot", "documentation.html")
				gsub_file documentation_file, /images\//, ""

		        # Remove everything before '<body\s+data' tag and after 'jquery.min.js', inclusive
		        new_documentation_file = File.open("#{documentation_file}.erb", "w")
		        include_line = false
		        IO.foreach(documentation_file) do |line|
		          include_line = false if line =~ /jquery.min.js/

		          new_documentation_file.write line if include_line

		          include_line = true if line =~ /<body\s+data/
		        end
		        new_documentation_file.close

		        # index.html
		        index_file = File.join(gem_assets_dir, "demo", "drunken-parrot", "index.html")
		        gsub_file index_file, /images\//, ""

		        # Remove everything before '<body\s+data' tag and after 'Bootstrap', inclusive
		        new_index_file = File.open("#{index_file}.erb", "w")
		        include_line = false
		        IO.foreach(index_file) do |line|
		          include_line = false if line =~ /Bootstrap/

		          new_index_file.write line if include_line

		          include_line = true if line =~ /<body\s+data/
		        end
		        new_index_file.close

		        # start-here.html
		        start_here_file = File.join(gem_assets_dir, "demo", "drunken-parrot", "start-here.html")
		        gsub_file start_here_file, /images\//, ""

		        # Remove everything before '<body\s+data' tag and after 'jquery.min.js', inclusive
		        new_start_here_file = File.open("#{start_here_file}.erb", "w")
		        include_line = false
		        IO.foreach(start_here_file) do |line|
		          include_line = false if line =~ /jquery.min.js/

		          new_start_here_file.write line if include_line

		          include_line = true if line =~ /<body\s+data/
		        end
		        new_start_here_file.close
			end
		end
	end
end
module DrunkenParrotFlatUi
  module Rails
    class Engine < ::Rails::Engine
        initializer 'drunken_parrot_flat_ui-rails.setup',
        	:after => 'less-rails.before.load_config_initializers',
        	:group => :all do |app|
            if defined?(Less)
              	app.config.less.paths << File.join(config.root, 'app', 'assets', 'less')
            end
        end    	
    end
  end
end
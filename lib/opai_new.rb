# The options hash determines stores data during the optional setup,
# allowing conditional setup to run properly
options = {}

# Default generate commands are registered here
generate_these = [['backbone:install']]

# The generators hash specifies some options for the default Rails generators
generators = {
  template_engine:  false,
  stylesheets:      false,
  helper:           false,
  assets:           false
}

# Base setup
gem('backbone-on-rails', git: 'git@github.com:e-serge/backbone-on-rails', branch: 'opai')
gem('handlebars_assets')
gem('inherited_resources')
gem_group :development, :test do
  gem('rspec-rails')
end

# Optional setup
if yes?('Install MongoMapper?')
  gem('mongo_mapper')
  gem('bson_ext')
  generate_these << ['mongo_mapper:config']
  options[:mongo_mapper] = true
  generators[:orm] = :mongo_mapper
end
if yes?('Install Devise?')
  gem('devise')
  generate_these << 'devise:install'
  model_name = ask('Enter the name for the user model [default: user] ')
  model_name = 'user' if model_name.blank?
  generate_these << ['devise', model_name]
  options[:devise] = true
end

# Conditional setup, based on optional setup
gem('devise-mongo_mapper') if options[:mongo_mapper] and options[:devise]

# Registered generators get executed here
generate_these.each{ |g| generate(*g) }

# Application configuration is specified over here
environment <<TEXT
config.generators do |g|
  #{generators.map{ |k,v| "g.#{k} #{v}"}}
end
TEXT

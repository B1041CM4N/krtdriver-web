source 'https://rubygems.org'

ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# #BOOTSTRAP
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
# #ICONOS
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
# #LOGIN, REGISTRO, Y MANEJO DE PASSWORD
gem 'devise', '~> 4.3'

# SIDEKIQ PARA WORKERS Y TAREAS EN MULTIPLES HILOS
gem 'sidekiq', '~> 5.0'

# Retina tag para las imagenes en mayor resolución
# gem 'retina_rails'
gem 'retina_tag'

# SUBIDA DE ARCHIVOS
gem 'carrierwave'

gem 'figaro', '~> 1.1', '>= 1.1.1'

# Validar RUT Chileno
gem 'run_cl'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# TRADUCCIONES
gem 'i18n', '~> 0.8.1'

# GENERACION DE REPORTES - XLSX
gem 'rubyzip', '~> 1.1.0'
gem 'axlsx', '2.1.0.pre'
gem 'axlsx_rails'

# Validaciones
gem 'client_side_validations'

# Geocodificación
gem 'geocoder'
gem 'google_maps_service'

gem 'annotate'

# Subir y leer de Google Drive
gem 'google_drive'

# Use Capistrano for deployment
gem 'capistrano-rails', group: :development

# == JSON
gem 'oj', require: false # JSON optimizado. https://github.com/ohler55/oj
gem 'rabl' # Templates para JSON, XML, etc. https://github.com/nesquena/rabl

gem 'faker', '~> 1.7', '>= 1.7.3'

# Paginación
gem 'kaminari'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'heroku-deflater'
  gem 'rails_12factor'
  gem 'rails_serve_static_assets'
  gem 'sprockets_better_errors'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

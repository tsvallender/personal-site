source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby file: "./.ruby-version"

gem "rails", "~> 7.1"
gem "sprockets-rails"
gem "pg"
gem "puma"
gem "image_processing"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "flaggle_rock", git: "https://git.tsvallender.co.uk/tsv/flaggle_rock"

gem "kaminari" # Pagination
gem "solid_cache"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

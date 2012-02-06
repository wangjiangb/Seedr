# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bigdata::Application.initialize!

ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(
  :default => '%d %b %Y'
)

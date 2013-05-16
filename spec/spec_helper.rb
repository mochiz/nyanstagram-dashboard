require 'simplecov'
require 'simplecov-rcov'
require 'dotenv'

Dotenv.load

SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start

$:.unshift File.dirname(__FILE__)+'../lib'

# VCR.configure do |c|
#   # Automatically filter all secure details that are stored in the environment
#   ignore_env = %w{SHLVL RUNLEVEL GUARD_NOTIFY DRB COLUMNS USER LOGNAME LINES}
#   (ENV.keys-ignore_env).select{|x| x =~ /\A[A-Z_]*\Z/}.each do |key|
#     c.filter_sensitive_data("<#{key}>") { ENV[key] }
#   end
#   c.cassette_library_dir = 'spec/cassettes'
#   c.default_cassette_options = { :record => :once }
#   c.hook_into :fakeweb
#   c.configure_rspec_metadata!
# end

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end

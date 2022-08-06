#!/usr/bin/env ruby
# __FUCK LICENSE FOR YOU__
# __The MIT License (MIT)__
# __Copyright (C) 2022 ALIF FUSOBAR. Master Of ITSecurity <https://itsecurity.id/>__

require 'coveralls'
Coveralls.wear!

require_relative '../lib/scanner'
require_relative '../lib/module_scanner'
require_relative '../lib/fingerprint_scanner'
require_relative '../lib/component_scanner'
require_relative '../lib/extension_scanner'
require_relative '../lib/template_scanner'

RSpec.configure do |config|
  config.before :each do
    Typhoeus::Expectation.clear
  end
end

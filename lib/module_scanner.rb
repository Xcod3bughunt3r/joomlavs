#!/usr/bin/env ruby
# __FUCK LICENSE FOR YOU__
# __The MIT License (MIT)__
# __Copyright (C) 2022 ALIF FUSOBAR. Master Of ITSecurity <https://itsecurity.id/>__

require_relative 'extension_scanner'

# This class provides functionality to scan for
# vulnerable Joomla modules.
class ModuleScanner < ExtensionScanner
  def initialize(target_uri, opts)
    super(target_uri, 'data/modules.json', opts)
  end

  def extension_prefix
    'mod_'
  end

  def directory_name
    'modules'
  end
end

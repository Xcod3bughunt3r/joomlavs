#!/usr/bin/env ruby
# __FUCK LICENSE FOR YOU__
# __The MIT License (MIT)__
# __Copyright (C) 2022 ALIF FUSOBAR. Master Of ITSecurity <https://itsecurity.id/>__

require_relative 'extension_scanner'

# This class provides functionality to scan for
# vulnerable Joomla components.
class ComponentScanner < ExtensionScanner
  def initialize(target_uri, opts)
    super(target_uri, 'data/components.json', opts)
  end

  def extension_prefix
    'com_'
  end

  def directory_name
    'components'
  end
end

#!/usr/bin/env ruby
# __FUCK LICENSE FOR YOU__
# __The MIT License (MIT)__
# __Copyright (C) 2022 ALIF FUSOBAR. Master Of ITSecurity <https://itsecurity.id/>__

module JoomlaVS
  module Modules
    def build_modules_filter(scanner)
      scanner.build_filter(fingerprint_scanner.modules_listing_enabled, fingerprint_scanner.administrator_modules_listing_enabled)
    end

    def scan_modules
      scan(:modules, ModuleScanner, opts[:scan_modules])
    end
  end
end

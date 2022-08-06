#!/usr/bin/env ruby
# __FUCK LICENSE FOR YOU__
# __The MIT License (MIT)__
# __Copyright (C) 2022 ALIF FUSOBAR. Master Of ITSecurity <https://itsecurity.id/>__

module JoomlaVS
  module Components
    def build_components_filter(scanner)
      scanner.build_filter(fingerprint_scanner.components_listing_enabled, fingerprint_scanner.administrator_components_listing_enabled)
    end

    def scan_components
      scan(:components, ComponentScanner, opts[:scan_components])
    end
  end
end

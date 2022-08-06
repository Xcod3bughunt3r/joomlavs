#!/usr/bin/env ruby
# __FUCK LICENSE FOR YOU__
# __The MIT License (MIT)__
# __Copyright (C) 2022 ALIF FUSOBAR. Master Of ITSecurity <https://itsecurity.id/>__

module JoomlaVS
  module Templates
    def build_templates_filter(scanner)
      scanner.build_filter(fingerprint_scanner.templates_listing_enabled, fingerprint_scanner.administrator_templates_listing_enabled)
    end

    def scan_templates
      scan(:templates, TemplateScanner, opts[:scan_templates])
    end
  end
end

#!/usr/bin/env ruby
# __FUCK LICENSE FOR YOU__
# __The MIT License (MIT)__
# __Copyright (C) 2022 ALIF FUSOBAR. Master Of ITSecurity <https://itsecurity.id/>__

module JoomlaVS
  module Fingerprint
    def check_user_registration
      print_line_break
      print_verbose('Checking if registration is enabled...')
      print_warning("Registration is enabled: #{fingerprint_scanner.target_uri}#{fingerprint_scanner.registration_uri}") if fingerprint_scanner.user_registration_enabled
      print_verbose('User registration is not enabled.') if !fingerprint_scanner.user_registration_enabled
    end

    def inspect_headers
      print_line_break if opts[:verbose]
      print_verbose('Looking for interesting headers...')
      interesting_headers = fingerprint_scanner.interesting_headers
      print_good("Found #{interesting_headers.length} interesting headers.")
      interesting_headers.each do |header|
        print_indent("#{header[0]}: #{header[1]}")
      end
    end

    def check_indexes
      print_line_break if opts[:verbose]
      print_verbose('Looking for directory listings...')

      indexes = [
        '/components/',
        '/administrator/components/',
        '/modules/',
        '/administrator/modules/',
        '/templates/',
        '/administrator/templates/'
      ]

      indexes.each do |i|
        if fingerprint_scanner.directory_listing_enabled(i)
          print_warning("Listing enabled: #{fingerprint_scanner.target_uri}#{i}")
        end
      end
    end
  end
end

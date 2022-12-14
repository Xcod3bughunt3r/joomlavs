#!/usr/bin/env ruby
# __FUCK LICENSE FOR YOU__
# __The MIT License (MIT)__
# __Copyright (C) 2022 ALIF FUSOBAR. Master Of ITSecurity <https://itsecurity.id/>__

require 'typhoeus'

# This class provides the base functionality
# for all the scanner classes.
class Scanner
  def initialize(target_uri, opts)
    update_target_uri target_uri
    @opts = opts
    @hydra = Typhoeus::Hydra.new(max_concurrency: opts[:threads])
  end

  def target_uri
    @target_uri
  end

  def update_target_uri(value)
    @target_uri = value.chomp('/')
  end

  def hydra
    @hydra
  end

  def follow_redirection
    @opts[:follow_redirection]
  end

  def normalize_uri(*parts)
    uri = parts * '/'
    uri = uri.gsub!('//', '/') while uri.index('//')

    # Makes sure there's a starting slash
    unless uri[0, 1] == '/'
      uri = '/' + uri
    end

    uri
  end

  def create_request(path)
    req = Typhoeus::Request.new(
      target_uri + path,
      followlocation: @opts[:follow_redirection] ? true : false,
      headers: { 'User-Agent' => @opts[:user_agent] },
      ssl_verifyhost: @opts[:disable_tls_checks] ? 0 : 2,
      ssl_verifypeer: !@opts[:disable_tls_checks]
    )
    req.options['userpwd'] = @opts[:basic_auth] if @opts[:basic_auth]
    req.options['proxy'] = @opts[:proxy] if @opts[:proxy]
    req.options['proxyuserpwd'] = @opts[:proxy_auth] if @opts[:proxy_auth]
    req
  end

  def index_request
    create_request('/')
  end

  def run_request(req)
    req.on_complete do |resp|
      return resp
    end

    req.run
  end

  def target_redirects_to
    req = create_request('/')
    req.options['followlocation'] = false
    loc = nil
    resp = run_request(req)

    if resp.code == 301 || resp.code == 302
      loc = resp.headers['location']
    end

    loc
  end

  def extract_version_number(text)
    match = /([0-9]+(\.?[0-9]+)?(\.?[0-9]+)?)+/.match(text)
    return match.captures[0] if match
  end
end

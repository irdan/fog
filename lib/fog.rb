require 'rubygems'
require 'base64'
require 'cgi'
require 'digest/md5'
require 'excon'
require 'hmac-sha1'
require 'hmac-sha2'
require 'json'
require 'mime/types'
require 'nokogiri'
require 'time'

__DIR__ = File.dirname(__FILE__)

$LOAD_PATH.unshift __DIR__ unless
  $LOAD_PATH.include?(__DIR__) ||
  $LOAD_PATH.include?(File.expand_path(__DIR__))

module Fog

  def self.mock!
    @mocking = true
    self.reload
  end

  def self.mocking?
    !!@mocking
  end

  def self.reload
    load "fog/collection.rb"
    load "fog/connection.rb"
    load "fog/model.rb"
    load "fog/parser.rb"

    load "fog/aws.rb"
    load "fog/rackspace.rb"
  end

  def self.credentials(path = File.expand_path('~/.fog'))
    @credentials ||= begin
      credentials = {}
      File.open(path) do |file|
        credentials = YAML.load(file.read)[:default]
      end
      credentials
    end
  end

end

Fog.reload

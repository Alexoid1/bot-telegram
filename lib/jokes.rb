# frozen_string_literal: true

# rubocop:disable Style/Documentation
require 'rubygems'
require 'httparty'
require 'json'

class Jokes
  include HTTParty
  base_uri 'gist.githubusercontent.com'

  def posts
    self.class.get('/Alexoid1/d1910480dd2a0cbfeadafc11ae13e839/raw/eb7e90eecf09c2d35255b822f6186159ee5e3ac0/joke.json')
  end
end
# rubocop:enable Style/Documentation

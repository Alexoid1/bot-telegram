# frozen_string_literal: true

require 'rubygems'
require 'httparty'
require 'json'

# rubocop:disable Style/Documentation

class Quotes
  include HTTParty
  base_uri 'type.fit'

  def posts
    self.class.get('/api/quotes')
  end
end
# rubocop:enable Style/Documentation

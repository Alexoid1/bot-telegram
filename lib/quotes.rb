# frozen_string_literal: true

# rubocop:disable Style/Documentation
require 'rubygems'
require 'httparty'
require 'json'

class Quotes
  include HTTParty
  base_uri 'type.fit'

  def posts
    self.class.get('/api/quotes')
  end
end
# rubocop:enable Style/Documentation

# frozen_string_literal: true

require_relative '../lib/quotes.rb'

describe Quotes do
  let(:quote) { Quotes.new }

  it 'Check returned joke data type of string' do
    expect(JSON.parse(quote.posts).sample.class).to eq(Hash)
  end
end

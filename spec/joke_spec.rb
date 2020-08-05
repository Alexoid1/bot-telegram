require_relative '../lib/jokes.rb'

describe Jokes do
  let(:joke) { Jokes.new }

  it 'Check returned joke data type of string' do
    expect(JSON.parse(joke.posts).sample.class).to eq(Hash)
  end
end

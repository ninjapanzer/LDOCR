require 'spec_helper'
require_relative '../lib/dictionary_processor'

describe 'DictionarySpec' do
  let(:processor) { DictionaryProcessor.new datafiles: 'spec/fixtures/word_sources/' }

  before :each do
    processor.load_dictionary
  end

  it 'loads all index files' do
    expect(Word.count).to eq(10)
  end

  it 'loads five verbs and five nouns' do
    expect(Word.where(part_of_speech: 'v').count).to eq(5)
    expect(Word.where(part_of_speech: 'n').count).to eq(5)
  end

  it 'can find a word by name' do
    specific_word = Word.where(part_of_speech: 'v', word: 'abacinate').first.definition
    expect(specific_word).to eq('02168378')
  end
end
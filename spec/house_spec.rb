require 'simplecov'

SimpleCov.start

require 'rspec'
require_relative '../lib/house'

RSpec.describe House, '#add_member' do
  subject(:house) do
    House.new('Lannister')
  end

  let(:tyrion) do
    Member.new('Tyrion')
  end
  
  it 'should member to house' do
    house.add_member(tyrion)
    expect(house.member('Tyrion')).to eql(tyrion)
  end
end

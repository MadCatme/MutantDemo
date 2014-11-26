require 'simplecov'

SimpleCov.start

require 'rspec'
require_relative '../lib/house'

RSpec.describe House, '#initialize' do
  subject(:house) do
    House.new('Lannister')
  end
  
  it 'should have the correct name' do
    expect(house.name).to eql('Lannister')
  end

  it 'should have no members' do
    expect(house.members).to eql([])
  end
end


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

  it 'should return house' do
    expect(house.add_member(tyrion)).to be(house)
  end
end

RSpec.describe House, '#member' do
  subject(:house) do
    House.new('Lannister')
  end

  let(:tyrion) do
    Member.new('Tyrion')
  end
  
  it 'should return a member' do
    house.add_member(tyrion)
    expect(house.member('Tyrion')).to eql(tyrion)
  end

  it 'should return nil if the member is not found' do
    house.add_member(tyrion)
    expect(house.member('Joffrey')).to be_nil
  end
end
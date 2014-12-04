# Class for a noble house of the Seven Kingdoms of Westeros
class House
  attr_reader :members
  attr_reader :name

  def initialize(name)
    @members = []
    @name = name
  end

  # Find and return member of the house by given name
  #
  # @param [String] name
  #
  # @return [String]
  #
  def member(name)
    @members.find do |member|
      member.name === name
    end
  end

  # Add member to house
  #
  # @param [Member] member
  #
  # @return [House]
  #
  def add_member(member)
    @members.push(member)
    self
  end
end

class Member < Struct.new(:name)

end

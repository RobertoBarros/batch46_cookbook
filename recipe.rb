class Recipe
  attr_reader :name, :description
  attr_accessor :cook_time, :done, :difficulty
  def initialize(name, description)
  @name = name
  @description = description
  @done = false
  end

  def mark_as_done
    @done = true
  end
end
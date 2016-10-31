require 'csv'
class Cookbook
  def initialize(csv_file)
    @recipes =[]
    @csv = csv_file
    load
  end

  def all
    @recipes
  end

  def list(index)
    @recipes[index]
  end

  def add(recipe)
    @recipes << recipe
    save
  end
  def destroy(index)
    @recipes.delete_at(index)
    save
  end

  def save
    CSV.open(@csv, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.cook_time, recipe.done, recipe.difficulty]
      end
    end
  end

  private

  def load
    CSV.foreach(@csv) do |row|
      recipe = Recipe.new(row[0], row[1])
      recipe.cook_time = row[2]
      recipe.done = (row[3] == 'true')
      recipe.difficulty = row[4]
      @recipes << recipe
    end
  end


end
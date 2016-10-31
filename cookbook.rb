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
  def add(recipe)
    @recipes << recipe
    save
  end
  def destroy(index)
    @recipes.delete_at(index)
    save
  end

  private

  def load
    CSV.foreach(@csv) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save
    CSV.open(@csv, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

end
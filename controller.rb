require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def create
    name = @view.ask_name
    description = @view.ask_description
    recipe = Recipe.new(name, description)
    @cookbook.add(recipe)
  end

  def list
    recipes = @cookbook.all
    @view.list(recipes)
  end

  def destroy
    index = @view.ask_index_to_destroy
    @cookbook.destroy(index)
  end

end
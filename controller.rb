require_relative 'view'
require_relative 'recipe'
require_relative 'parser'

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

  def import_recipe
    ingredient = @view.ask_ingredient
    parser = Parser.new
    recipes_names = parser.list_by_ingredient(ingredient)
    @view.show_recipes_names(recipes_names)
    index = @view.ask_index_to_import
    recipe = parser.import(index)
    @cookbook.add(recipe)
  end

  def mark_as_done
    index = @view.ask_index_to_mark_as_done
    recipe = @cookbook.list(index)
    recipe.mark_as_done
    @cookbook.save
  end

end
class View
  def ask_name
    puts "Type the name of your recipe"
    gets.chomp
  end

  def ask_description
    puts "Type the description of your recipe"
    gets.chomp
  end

  def list(recipes)
    recipes.each_with_index do |recipe, i|
      done = recipe.done ? '[X]' : '[ ]'
      puts "˜˜˜˜˜˜˜˜˜\n\n#{i + 1} #{done} #{recipe.name} (Difficulty: #{recipe.difficulty}) (#{recipe.cook_time}): \n\n #{recipe.description}\n\n˜˜˜˜˜˜˜˜˜\n\n"
    end
  end
  def ask_index_to_destroy
    puts "Type the index of the recipe to erase"
    gets.chomp.to_i - 1
  end

  def ask_ingredient
    puts 'What ingredient do you want import?'
    gets.chomp
  end

  def show_recipes_names(recipes_names)
    recipes_names.each_with_index do |recipe_name, index|
      puts "#{index + 1} - #{recipe_name}"
    end
  end

  def ask_index_to_import
    puts 'Choose a recipe number to import:'
    gets.chomp.to_i - 1
  end

  def ask_index_to_mark_as_done
    puts 'Choose a recipe number to mark as done:'
    gets.chomp.to_i - 1
  end

end
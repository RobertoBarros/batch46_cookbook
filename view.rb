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
      puts "˜˜˜˜˜˜˜˜˜\n\n#{i + 1} - #{recipe.name}: \n\n #{recipe.description}\n\n˜˜˜˜˜˜˜˜˜\n\n"
    end
  end
  def ask_index_to_destroy
    puts "Type the index of the recipe to erase"
    gets.chomp.to_i - 1
  end
end
class HomeController < ApplicationController
  
  def index
    @recipe = Recipe.all.reverse
    @ingre = Ingredient.all
  end


  def recipesave
    recipe = Recipe.new
    recipe.title = params[:title]
    recipe.recipe = params[:recipe]
    recipe.img_url = params[:img_url]
    recipe.save
     ingre = Ingredient.all
    ingre = Ingredient.create(ingre: params[:ingre], recipe_id: Recipe.last.id)
    ingre.save
    redirect_to '/home/index#work'
  end

  def search1

         Ingredient2.destroy_all
          ingre1=Ingredient.all
          keyword=Array.new.push(params[:keyword]).first.split("#")
          ingre1.each do |i|
          ingre=Array.new.push(Ingredient.find(i.id).ingre.split("#")).first


          if( keyword  - ingre == [])
                @ingre2=Ingredient2.create(recipe_id: i.recipe_id).save
                ingre.clear
          end
          ingre.clear
               end
          redirect_to '/home/searchview'

  end
  def searchview
      @ingre2 = Ingredient2.all.reverse
  end
  def reply

      @reply = Reply.create(reply: params[:reply], recipe_id: params[:id])
      @reply.save
      redirect_to '/home/index#work'

  end
end

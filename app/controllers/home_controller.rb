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
    recipe.user = current_user
    recipe.save
    redirect_to '/home/ingredient'
  end
  
  def ingredient
    if user_signed_in?
        ingre = Ingredient.all
        @arr = Array.new
        ingre.each do |i|
          @arr.push(i.ingre)
        end
    else 
      redirect_to '/users/sign_in'
    end
  end
  
  def ingredientsave
    ingre = Ingredient.all
    ingre = Ingredient.create(ingre: params[:ingre], recipe_id: params[:id])
    ingre.save
    redirect_to '/home/index#work'
  end
  
  def search1
   
         Ingredient2.destroy_all
          ingre1=Ingredient.all
          keyword=Array.new.push(params[:keyword]).first.split("#")
          ingre1.each do |i|
          ingre=Array.new.push(Ingredient.find(i.recipe_id).ingre.split("#")).first
        
        
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
    if user_signed_in?
      @reply = Reply.create(reply: params[:reply], recipe_id: params[:id], user: current_user)
      @reply.save
      redirect_to '/home/index#work'
    else 
      redirect_to '/users/sign_in'
    end
  end
end
        
 
    
        
       
        
    
    
    
        



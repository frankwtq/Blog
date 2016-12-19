class WelcomesController < ApplicationController
  def home
	  @articles = Article.all
  end

  def help
  end

  def contact
  end
end

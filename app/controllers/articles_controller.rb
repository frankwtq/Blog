class ArticlesController < ApplicationController
	before_action :have_login, only: [:edit, :destroy, :new]
  def show
	  @article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
	  @article = Article.new(article_params)
		@article.save
		redirect_to root_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update_attributes(article_params)
		redirect_to @article
	end

	def destroy
		Article.find(params[:id]).destroy
		redirect_to root_path
	end 

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

		def have_login
			if $remember_token.to_s != cookies[:remember_token]
				redirect_to login_path
			end
		end
end

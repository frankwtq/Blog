class WelcomesController < ApplicationController
  $admin = false
	$remember_token = 123456
	def home
	  @articles = Article.all
  end

  def help
  end

  def contact
  end

	def login
	end

	def authentication
		if params[:welcome][:password] == "123456"
			$admin = true
			remember_token = rand(0xffffff) 
			cookies.permanent[:remember_token] = remember_token
			$remember_token = remember_token
			redirect_to root_path
		else
			redirect_to login_path
		end
	end

	def logout
		$admin = false
		$remember_token = rand(0xffffff)
		cookies.delete(:remember_token)
		redirect_to root_path
	end

 	def admin?
		@@admin == 1
	end

end

class WelcomesController < ApplicationController
  $admin = false
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
			redirect_to root_path
		else
			redirect_to login_path
		end
	end

	def logout
		$admin = false
		redirect_to root_path
	end

 	def admin?
		@@admin == 1
	end
end

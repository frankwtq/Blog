module ApplicationHelper
# Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "frankwtq blog"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end

def have_login?
	$remember_token.to_s == cookies[:remember_token]
end

def have_login
	if $remember_token.to_s != cookies[:remember_token]
		redirect_to login_path
	end
end

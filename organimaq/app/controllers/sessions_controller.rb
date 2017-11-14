class SessionsController < ApplicationController
	
	def new
		
	end
	
	def create
		user = User.authenticate(params[:usuario], params[:password])
		
		if user
			session[:user_id] = user.id
			redirect_to root_url #, :notice => "Logged in!"
		else
			flash.now.alert = "Usuario o contraseña invalida"
			render "new"
		end
	end
	
	def destroy
	  session[:user_id] = nil
	  redirect_to root_url#, :notice => "Logged out!"
	end
end

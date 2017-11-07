
class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  helper_method :current_user
  

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

  
  def search_params
	params[:q]
  end
 
  def clear_search_index
	if params[:search_cancel]
		params.delete(:search_cancel)
    if(!search_params.nil?)
      search_params.each do |key, param|
        search_params[key] = nil
      end
    end
    end
  end

  

  private
  	def set_time_zone
  		Time.zone = current_user.time_zone
  	end
	
	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
end

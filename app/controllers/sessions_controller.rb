class SessionsController < ApplicationController

    def new
    end
    
    def create
        author = Author.find_by_email(params[:session][:email].downcase)
        if author && author.authenticate(params[:session][:password])
            flash[:success] = "logged in!"
            sign_in author
            redirect_back_or author
        else
            flash[:error] = "Invalid email/password combination"
            render 'new'
        end
    end
    
    def destroy
        sign_out
        redirect_to root_url
    end

end

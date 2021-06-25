class HomeController < ApplicationController
    def index
        logger.debug params[:email]
        cookies.delete :magic
    end

    def send_magic_link
        response.set_cookie "magic", "dough"
    end

    def authenticate
        logger.debug cookies[:magic] 
        if (cookies[:magic] == "dough" && params[:auth_token] == "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c")
            render 'logged_in'
        else
            render :file => "public/401", :status => :unauthorized
        end
    end
end
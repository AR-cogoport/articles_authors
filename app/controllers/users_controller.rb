class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def cred_show
        c=User.all
        render json: c
    end
    def credentials
        c=User.create(email: params[:email],password: params[:password],
            name: params[:name],phone: params[:phone])
        render json: c
    end
    
    def check_cred
        c=User.where(email: params[:email])
        if c.length!=0
            if c[0].authenticate(params[:password])
                render html: "Password matched"
            else render html: "Password not matched"
            end
        else
            render html: "email id not exist"
        end
        # render json: c
    end

    def update_pass
        c=User.where(email: params[:email])
        if c.length!=0
            if c[0].authenticate(params[:oldpassword])
                c[0].update(password: params[:newpassword])
            else render html: "Old Password is wrong"
            end
        else render html: "email id not exist"
        end
    end

    def del_user
        c=User.find(params[:id])
        c.destroy
    end
    




    
    
end

class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        if params[:id]
            ans=Article.find(params[:id])
        elsif params[:category]
         ans=Article.where(category: params[:category])
        elsif params[:author]
            ans=Article.where(author: params[:author])
        elsif params[:part_title]
            ans=Article.where("title like ?", "%#{params[:part_title]}%")
        elsif params[:date_range]
            # ans=Article.where(date: params[:date_range].split(",")[0]..params[:date_range].split(",")[1])
            ans=Article.where("date Between ? AND ?" , params[:date_range].split(",")[0], params[:date_range].split(",")[1])
        else
        ans=Article.all
        end
        render json: ans
        # end
    end

    def add
        c=Article.create(author: params[:author],title: params[:title],body: params[:body],date:params[:date],category:params[:category])
        render json: c
    end

    def find_id
        c=Article.find(params[:id])
        render json: c
    end
 
    def update_article
        c=Article.find(params[:id])
        c.update(author: params[:author])
        render json: c.author
    end

    def del_id
        c=Article.find(params[:id])
        c.destroy
    end

    # def find_by_cat
    #     c=Article.where(category: params[:category])
    #     render json: c
    #  end

    # def find_by_auth
    #     c=Article.where(author: params[:author])
    #     render json: c
    #  end

        
        
     
     


    
    # def user_params
    #     params.require(:c).permit(:author, :title, :body, :category, :date)
 end




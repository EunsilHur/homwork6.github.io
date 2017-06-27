class HomeController < ApplicationController
 before_filter :authenticate_user! 
 def index
         @posts = Post.all
    end
    def write
        
    end
    def write_post
        post = Post.new
        post.title = params[:title]
        post.content = params[:content]
        post.user_id = params[:user_id]
        post.save
        
         file = params[:pic]
         uploader = AvatarUploader.new
      uploader.store!(file)
        post.image_url = uploader.url
    
      flash[:notice] = "전송되었습니다"
      post.save
        
        redirect_to '/index'
    end
    def update
        @one_post = Post.find(params[:p_id])
     end
  
    def update_post
        one_post = Post.find(params[:p_id])
        one_post.title = params[:title]
        one_post.content = params[:content]
        one_post.save
        
       
        redirect_to '/index'
    end
    def destroy
        one_post = Post.find(params[:p_id])
        one_post.destroy
    
        redirect_to '/index'
    end
    def show
        @one_post = Post.find(params[:p_id])
        @title=Post.find(params[:p_id]).title
        @content=Post.find(params[:p_id]).content
        @senddate=Post.find(params[:p_id]).created_at.in_time_zone("Asia/Seoul").strftime("%Y-%m-%d %H:%M:%S")
    
  end
  
   def comment_create
    comment = Post.find(params[:p_id]).comments.create(content: params[:content],  cuser_id: params[:cuser_id])
    comment.save
    
    redirect_to "/show/#{comment.post_id}"
  end
  def comment_destroy
    comment = Post.find(params[:p_id]).comments.find(params[:c_id])
    comment.destroy
    
    redirect_to "/show/#{comment.post_id}"
  end
   def comment_update

    #params 주소로 넘겨온 
    @one_comment = Post.find(params[:p_id]).comments.find(params[:c_id])
  end
  
  def comment_update_post
    one_comment = Post.find(params[:p_id]).comments.find(params[:c_id])
    one_comment.content = params[:content]
    one_comment.save
    
    redirect_to "/show/#{one_comment.post_id}"
  end
  
  def like_create
    like =  Post.find(params[:p_id]).likes.create(like_count: 0)
    like.save
   
    redirect_to "/show/#{like.post_id}"
  end
 
 
end

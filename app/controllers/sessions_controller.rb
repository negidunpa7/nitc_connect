class SessionsController < ApplicationController
  def new
  end
  
  
def create
      @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user      
      #redirect_to user
      #@user.post=Post.new
      if(current_user.id == 68)
              redirect_to '/admin/show'
      else
            u=User.arel_table
            @connected1=Connect.where(user_id: current_user).pluck(:user2id)
            @connected2=Connect.where(user2id: current_user).pluck(:user_id)

            @connected1=@connected1+@connected2+[current_user.id]
            @data=User.where(u[:id].in(@connected1).not)
            @notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
            @noti=User.where(u[:id].in(@notiid))

          #friend request
            u=User.arel_table
            @connected1=Connect.where(user_id: current_user, approved: 't').pluck(:user2id)
            @connected2=Connect.where(user2id: current_user, approved: 't').pluck(:user_id)
            @connected1=@connected1+@connected2
            @connectedUsers=User.where(u[:id].in(@connected1))






            u=Post.arel_table
            @usertag=Userstag.where(:user_id => current_user).pluck(:tag_id)
            @postsids=Posttagnew.where(" tag_id in (?) " ,@usertag).pluck(:post_id)
            @posts=Post.where(" id in (?) ",@postsids)
            #@posts=current_user.posts  
            @tags = Tag.all

      redirect_to @user
    end
      #redirect_to @user

     
    else
      
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
end
def destroy
	log_out
	render 'new'
end

end






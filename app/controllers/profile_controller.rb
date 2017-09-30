class ProfileController < ApplicationController
def index
  @count =Post.where(:user_id => current_user).count
end
#def show
 #  @count = Post.where(:user_id => current_user).count
 #  u=User.arel_table
 #  @connected1=Connect.where(user_id: current_user, approved: 't').pluck(:user2id)
# @connected2=Connect.where(user2id: current_user, approved: 't').pluck(:user_id)
# @connected1=@connected1+@connected2
  #  @count =Post.where(:user_id => current_user).count

    #@total=@connected1.count

    #@posts = current_user.posts
 #end

 def show
    @user = User.find_by(:id => params[:id])
    @count = Post.where(:user_id => params[:id]).count
    u=User.arel_table
    @connected1=Connect.where(user_id: params[:id], approved: 't').pluck(:user2id)
    @connected2=Connect.where(user2id: params[:id], approved: 't').pluck(:user_id)
    @connected1=@connected1+@connected2
    @count =Post.where(:user_id => params[:id]).count

    @total=@connected1.count
  @notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
  @noti=User.where(u[:id].in(@notiid))

    @posts = @user.posts
 end



 def showconnect
   @user = User.find_by(:id => params[:id])
    u=User.arel_table
  @connected1=Connect.where(user_id:  params[:id], approved: 't').pluck(:user2id)
  @connected2=Connect.where(user2id:  params[:id], approved: 't').pluck(:user_id)
  @connected1=@connected1+@connected2
  @connectedUsers=User.where(u[:id].in(@connected1))
      @total=@connected1.count
  @notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
  @noti=User.where(u[:id].in(@notiid))

    @count =Post.where(:user_id =>  params[:id]).count


 end

end
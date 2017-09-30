class CommentsController < ApplicationController

def new
	@post = Post.find(params[:post_id])
	@news=News.all.limit(10)
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)
 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
end
def create
	@post = Post.find(params[:post_id])
	@comment = @post.comments.create(:user_id => current_user.id)
	@comment.update(comment_params)
	@news=News.all.limit(10)

	#@comment = @post.comments.create(comment_params)
	#@comment.user_id=current_user
	#@comment.save
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)
 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
	redirect_to current_user
end
def destroy
	@post = Post.find(params[:post_id])
	@news=News.all.limit(10)

    @comment = @post.comments.find(params[:id])
    @comment.destroy
    u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)
 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
    redirect_to current_user
end

private
   def comment_params
      params.require(:comment).permit(:body)
   end


end

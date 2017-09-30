class PostsController < ApplicationController
	@@post2=2
	def index
		@posts=Post.all
		@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
 	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)

 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))

#friend request
 	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user, approved: 't').pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user, approved: 't').pluck(:user_id)
 	@connected1=@connected1+@connected2
 	@connectedUsers=User.where(u[:id].in(@connected1))



	@news=News.all.limit(10)

	end

	def new
		 	u=User.arel_table

		@post = Post.new
		@tags = Tag.all
		@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)

 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))

#friend request
 	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user, approved: 't').pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user, approved: 't').pluck(:user_id)
 	@connected1=@connected1+@connected2
 	@connectedUsers=User.where(u[:id].in(@connected1))



	@news=News.all.limit(10)

		#@posttag = @post.posttags.build
	end
	
def addtags



	@postid=@@post2
   @tag_string=params[:tag_string]
	@tagid=Tag.find_by(:tag => @tag_string)
	if @tagid.blank?
		@tag=Tag.new(:tag => @tag_string)
		@tag.save
		@tagid=@tag
	end
	@tagg=Posttagnew.new(:post_id => @postid , :tag_id => @tagid.id)
       @tagg.save


		 	u=User.arel_table
	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
 	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)

 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))

#friend request
 	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user, approved: 't').pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user, approved: 't').pluck(:user_id)
 	@connected1=@connected1+@connected2
 	@connectedUsers=User.where(u[:id].in(@connected1))

	@news=News.all.limit(10)
	   flash.now[:success] = @tagid.tag+"Tag added to the post "

	render 'addtag'

end
def create
	#@userid = session[:user_id]
	#@post=Post.new(:user_id=>@userid,:title=>title,:body=>body)
	#@post = Post.new(post_params)
	#@user = User.find(params[:user_id])
					
					#@posttag.post_id= @post.id
					#@posttag.tag_id= tag.tag_id
					


	@post = Post.new(post_params) do |post|
    	post.user = current_user 
    	
	end 
	 	u=User.arel_table

	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
	@post.save 
	@tags=Tag.all
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)

 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))

#friend request
 	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user, approved: 't').pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user, approved: 't').pluck(:user_id)
 	@connected1=@connected1+@connected2
 	@connectedUsers=User.where(u[:id].in(@connected1))



	@news=News.all.limit(10)
	@@post2=@post.id
	render 'addtag'
	
	
	

	#params[:post][:id].each do |tag|
	#	if !tag.empty?
	#		@post.posttags.build(:tag_id => tag)
	#	end
	#end	


	
	
	#redirect_to '/users/show'
end
 def flagpost
 	 	u=User.arel_table

		acc=params[:postid]
 	 	@aa=Post.find_by(id: acc)
 	 	@count=@aa.flagcount
 	 	@count=@count+1
	@aa.update_attribute(:flagcount, @count)
#	@upvotetable =Upvote.new(:post_id => acc, :user_id => current_user)
@flageduser =Flag.new(:post_id => acc) do |flageduser|
    flageduser.user = current_user
	end
	@flageduser.save
	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
end
def upvote
acc=params[:postid]
 	 	@aa=Post.find_by(id: acc)
 	 	@count=@aa.upvotecount
 	 	@count=@count+1
	@aa.update_attribute(:upvotecount, @count)
#	@upvotetable =Upvote.new(:post_id => acc, :user_id => current_user)
@upvotetable =Upvote.new(:post_id => acc) do |upvotetable|
    upvotetable.user = current_user
	end
		@upvotetable.save
end
def delete
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)

 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))

#friend request
 	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user, approved: 't').pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user, approved: 't').pluck(:user_id)
 	@connected1=@connected1+@connected2
 	@connectedUsers=User.where(u[:id].in(@connected1))



	@news=News.all.limit(10)

	@idd=params[:id]
	@pos = Post.find_by(id: @idd)    
    @pos.destroy
    redirect_to current_user
end
def deleteprof
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)

 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))

#friend request
 	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user, approved: 't').pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user, approved: 't').pluck(:user_id)
 	@connected1=@connected1+@connected2
 	@connectedUsers=User.where(u[:id].in(@connected1))



	@news=News.all.limit(10)

@idd=params[:id]
	@pos = Post.find_by(id: @idd)    
    @pos.destroy
    redirect_to '/profile/show?id='+current_user.id.to_s
end
def removeupvote
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)

 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))

#friend request
 	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user, approved: 't').pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user, approved: 't').pluck(:user_id)
 	@connected1=@connected1+@connected2
 	@connectedUsers=User.where(u[:id].in(@connected1))



	@news=News.all.limit(10)

acc=params[:postid]
 	 	@aa=Post.find_by(id: acc)
 	 	@count=@aa.upvotecount
 	 	@count=@count-1
	@aa.update_attribute(:upvotecount, @count)
#	@upvotetable =Upvote.new(:post_id => acc, :user_id => current_user)
Upvote.find_by(:post_id => acc , :user_id => current_user ).destroy
#@upvotetable =Upvote.where(:post_id => acc , :user_id => current_user )
#@upvotetable.deletecommon
end
private 
def post_params
	params.require(:post).permit(:title,:body,:photo)
end


def addtags_params
	params.permit(:tag_string)
end
def upvote_params
		params.permit(:postid)

end
def downvote_params
		params.permit(:postid)

	end
def removeupvote_params
			params.permit(:postid)
		end
def flagpost_params
			params.permit(:postid)
end

end

class UsersController < ApplicationController
def new
	@user =User.new	
end


def create
	#@user = User.new(user_params)

	@tags = Tag.all
	@user = User.new
	@user.email=params[:email]

	@user.name=params[:name]

	@user.rollno=params[:rollno]

	@user.password=params[:password]

	@user.password_confirmation=params[:password_confirmation]

	@user.userType=params[:user][:userType]

	@user.areasOfInterest=params[:user][:areasOfInterest]

	@user.yearOfEnrollment=params[:user][:yearOfEnrollment]

	@user.course=params[:user][:course]

	@user.profilepic=params[:user][:profilepic]

	@user.description=params[:description]

	@user.idpic=params[:user][:idpic]
	@news=News.all.limit(10)

	if(@user.save)
		log_in @user
			u=User.arel_table
@news=News.all.limit(10)
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)
 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
		render 'addtag'
	else
		render 'new'
	end
end

def addtags
u=User.arel_table
@news=News.all.limit(10)
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)
 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
	@tag_string=params[:tag_string]
	@tagid=Tag.find_by(:tag => @tag_string)
	if @tagid.blank?
		@tag=Tag.new(:tag => @tag_string)
		@tag.save
		@tagid=@tag
	end
	@count=Userstag.where(:user_id => current_user).where(:tag_id => @tagid.id)
	if @count.size ==0
		@tagg =Userstag.new(:user_id => current_user.id , :tag_id => @tagid.id)
      @tagg.save
        flash.now[:success] = @tagid.tag+"  Added to area of interest "
	else
			flash.now[:danger]= "  Tag already added"

    end
render 'addtag'

end

def showuser
		u=User.arel_table
@news=News.all.limit(10)
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)
 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
	redirect_to current_user
end
def noti
		u=User.arel_table
@news=News.all.limit(10)
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)
 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
end

def show
	@news=News.all.limit(10)
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)

 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(10)



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
 	@posts=Post.where(" id in (?) ",@postsids).order("updated_at desc")
 	if @posts.size == 0
 		@posts=Post.all
 	end
	#@posts=current_user.posts	
	@tags = Tag.all

	#@posts=Post.where(:user_id=>current_user)
end

def search
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



	u=Post.arel_table
 	@usertag=Userstag.where(:user_id => current_user).pluck(:tag_id)
 	@postsids=Posttagnew.where(" tag_id in (?) " ,@usertag).pluck(:post_id)
 	@posts=Post.where(" id in (?) ",@postsids)
	#@posts=current_user.posts	
	@tags = Tag.all
	@s=params[:search]
	@tag=Tag.find_by(:tag => @s)
	if @tag.blank?
			flash.now[:danger] = 'Tag does not exist' 
			u=Post.arel_table
 	@usertag=Userstag.where(:user_id => current_user).pluck(:tag_id)
 	@postsids=Posttagnew.where(" tag_id in (?) " ,@usertag).pluck(:post_id)
 	@posts=Post.where(" id in (?) ",@postsids)
	#@posts=current_user.posts	
	@tags = Tag.all
			render 'show'
		else
		@tagid=@tag.id
		@postid=Posttagnew.where(:tag_id => @tagid).pluck(:post_id)
		@posts=Post.where(" id in (?) ",@postid)
		render 'show'
		end
end
def connect
	@aa=params[:curr]
	@bb=params[:conn]
	@conn=Connect.new(user_id: @aa , approved: 'false')	
	@conn.user2id=@bb;
	@conn.save
end
 def accept

 	acc=params[:notiuserid]
 	@notiuser= Connect.find_by(user2id: current_user,user_id: acc)
 	@notiuser.approved='true'
 	@notiuser.save
 end
 def edit
	@user = current_user
end

def update
	@user = User.find(params[:id])
 
 	@user.name=params[:name]

	

	@user.password=params[:password]

	@user.password_confirmation=params[:password_confirmation]

	@user.profilepic=params[:user][:profilepic]

		

	

	
@news=News.all.limit(10)
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






	u=Post.arel_table
 	@usertag=Userstag.where(:user_id => current_user).pluck(:tag_id)
 	@postsids=Posttagnew.where(" tag_id in (?) " ,@usertag).pluck(:post_id)
 	@posts=Post.where(" id in (?) ",@postsids).order("updated_at desc")
	#@posts=current_user.posts	
	@tags = Tag.all
	
 	 if @user.update(:name => params[:name],:password_confirmation => params[:password_confirmation],:profilepic => params[:user][:profilepic])
    	

    	render 'show'
  	 else
    	render 'edit'
  	 end
end
def edittag
	    u=User.arel_table
@news=News.all.limit(10)
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)
 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
 	render 

end
def edittags
	    u=User.arel_table
@news=News.all.limit(10)
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)
 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))

	@tag_string=params[:tag_string]
	@tagid=Tag.find_by(:tag => @tag_string)
	if @tagid.blank?
		@tag=Tag.new(:tag => @tag_string)
		@tag.save
		@tagid=@tag
	end
	@count=Userstag.where(:user_id => current_user).where(:tag_id => @tagid.id)
	if @count.size ==0
		@tagg =Userstag.new(:user_id => current_user.id , :tag_id => @tagid.id)
      @tagg.save
        flash.now[:success] = @tagid.tag+"Added to area of interest "
	else
			flash.now[:danger]= "Tag already added"

    end

render 'edittag'
	end

def removetag
	 u=User.arel_table
@news=News.all.limit(10)
	u=User.arel_table
 	@connected1=Connect.where(user_id: current_user).pluck(:user2id)
 	@connected2=Connect.where(user2id: current_user).pluck(:user_id)
 	@connected1=@connected1+@connected2+[current_user.id]
 	@data=User.where(u[:id].in(@connected1).not).limit(5)
 	@notiid=Connect.where(user2id: current_user, approved: 'f').pluck(:user_id)
 	@noti=User.where(u[:id].in(@notiid))
@userid=params[:id]
@usertagremove=Userstag.find_by(:id => @userid)
@tagname=Tag.find_by(:id => @usertagremove.tag_id)
@usertagremove.destroy
if @tagname.blank?
	else
			flash.now[:danger]=@tagname.tag+ "  Removed from area of interest added"
end
render 'edittag'
end
private
 def user_params
  	params.require(:user).permit(:name,:rollNo,:email,:password,:password_confirmation,:profilepic,:idpic)
 end
 def search_params
 	params.permin(:search)
 end
 def connect_params
 	params.require(:conn).permit(:curr,:conn)
 end
 def accept_params
 	params.require(:notiuserid).permit(:notiuserid)
 end 
 
end

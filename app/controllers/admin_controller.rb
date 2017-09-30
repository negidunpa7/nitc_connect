class AdminController < ApplicationController
	def show
		
	end
	def verify
		#unverified users for admin
	@unverified=User.where(verified: 'false')

	end

	def event
	end

	def tag
	end

	def news
	end
	def createnews
		@news=News.new(:body => params[:news])
		@news.save
		render 'show'
	end

	def addtags
		@tag_string=params[:tag]
	@tagid=Tag.find_by(:tag => @tag_string)
	if @tagid.blank?
		@tag=Tag.new(:tag => @tag_string)
		@tag.save
        flash.now[:success] = @tag_string+"  Added to area of interest "
	else
			flash.now[:danger]= "  Tag already added"
end
		render 'tag'
	end

	def spam
		@posts = Post.where.not(:flagcount => 0)
	end
	def ignore
@posts = Post.find_by(:id =>params[:id])
@posts.flagcount=0
@posts.save
	end
def destroy
	@idd=params[:id]
	@pos = Post.find_by(id: @idd)    
    @pos.destroy
end

def destroyuser
	@idd=params[:usr]
	@pos = User.find_by(id: @idd)    
    @pos.destroy
    @connected=Connect.where('user_id=? OR user2id=? ',@idd,@idd)
    @connected.each do |connected|
    connected.destroy
end
end

	def verified
	acc=params[:usr]
 	 	@aa=User.find_by(id: acc)
	@aa.update_attribute(:verified, 'true')
 end
 private
 def verified_params
 	params.require(:usr).permit(:usr)
 end
def destroy_params
params.permit(:id)
end
end

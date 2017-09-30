class TagsController < ApplicationController
#def typeahead
#  	render json: Tag.where(tag: params[:query])
#end
def typeahead
  render json: Model.where('name ilike ?', "%#{params[:query]}%")
end

end

class CommentsController < ActionController::Base
  def index
	@comments = Comment.all
	
	respond_to do |format|
		format.html
	end
  end
  
  def new
	@comment = Comment.new
	render :partial => 'comment', :locals => {:comment => @comment}
  end
  
  def create
	@comment = Comment.new(params[:comment])
	
	respond_to do |format|
		if @comment.save
			format.html { redirect_to @comment.post }
			format.js
		else
			format.html { render action: "new" }
			format.js
		end
	end
  end
  
  def show
	@comment = Comment.find(params[:id])
	
	respond_to do |format|
		format.html
	end
  end
  
  def edit
	@comment = Comment.find(params[:id])
  end
  
  def update
	@comment = Comment.find(params[:id])
	
	respond_to do |format|
		if @comment.update_attributes(params[:comment])
			format.html { redirect_to @comment.post }
		else
			format.html { render action: "edit" }
		end
	end
  end
  
  def destroy
	@comment = Comment.find(params[:id])
	@comment.destroy
	
	respond_to do |format|
		format.html { redirect_to comments_url }
	end
  end
  
end

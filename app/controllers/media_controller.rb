class MediaController < ApplicationController
    def index

    @albums = Medium.where(kind: 'album').sort_by { |medium| medium.votes.size }.reverse

    @books = Medium.where(kind: 'book').sort_by { |medium| medium.votes.size }.reverse

    @movies = Medium.where(kind: 'movie').sort_by { |medium| medium.votes.size }.reverse

  end

  def new
    @my_medium = Medium.new(kind: params[:kind])
    # @my_medium.kind = params[:kind]
    @post_method = :post
    @post_path = 'create'
  end

  def create
    @params = params
    @my_medium = Medium.new
    @my_medium.title = params[:medium][:title]
    @my_medium.maker = params[:medium][:maker]
    @my_medium.description = params[:medium][:description]
    @my_medium.kind = params[:medium][:kind]
    
    if @my_medium.save
      redirect_to index_path
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled!"
      @post_method = :post
      @post_path = create_path
      render :new
    end
  end

  def show
    @my_medium = Medium.find(params[:id])
      
#chris's idea
    if @my_medium == nil
      flash[:notice] = "That item does not exist."
      redirect_to action: "index"
      # if @my_medium == nil
      # render :file => 'public/404.html',
      #     :status => :not_found
    end  
  end

  def show_albums
    @albums = Medium.where(kind: 'album').sort_by { |medium| medium.votes.size }.reverse
  end

  def show_books
    @books = Medium.where(kind: 'book').sort_by { |medium| medium.votes.size }.reverse
  end

  def show_movies
    @movies = Medium.where(kind: 'movie').sort_by { |medium| medium.votes.size }.reverse
  end


  def edit
    @my_medium = Medium.find(params[:id])
    @post_method = :put
    @post_path = update_path
  end

  def update
    @params = params
    @my_medium = Medium.find(params[:id])

    # if @my_medium == nil
    #     render :file => 'public/404.html',
    #         :status => :not_found
    # end  

    @my_medium.title = params[:medium][:title]
    @my_medium.maker = params[:medium][:maker]
    @my_medium.description = params[:medium][:description]
  
    if @my_medium.save
      redirect_to index_path
    else
      flash[:notice] = "Did not save successfully. Try again!"
#maybe??
      redirect_to update_path
    end   
    @post_method = :put
    @post_path = update_path 
  end

  def destroy
    @my_medium = Medium.find(params[:id])
    if @my_medium != nil
      @my_medium.destroy
      redirect_to index_path
    end    
  end

  def upvote
    @my_medium = Medium.find(params[:id])
    @my_medium.votes.create
    redirect_to(index_path)
  end

  def downvote
    @my_medium = Medium.find(params[:id])
    if @my_medium.votes.count >= 1
      @my_medium.votes.first.destroy
    else
      begin
        flash[:notice] = "You can't vote this #{@my_medium.kind} any lower. It's already at '0.'"
        raise "An error has occurred."
      rescue
      end
    end
    redirect_to(index_path)
  end
end

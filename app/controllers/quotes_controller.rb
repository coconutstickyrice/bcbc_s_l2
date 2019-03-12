class QuotesController < ApplicationController

# display a random quote stored in database   
  def index
      @quote = Quote.order("RANDOM()").first
  end

# get new quote from user via form 
  def new
    @quote = Quote.new
  end

# sends quote (saying & author) to database 
  def create
    Quote.create(quote_params)
    redirect_to root_path
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

end

class QuotesController < ApplicationController

# display a random quote stored in database   
  def index
      @quote = Quote.order("RANDOM()").first
  end

# sends quote (saying & author) to database 
  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end    
      redirect_to root_path
  end

  def about
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

end

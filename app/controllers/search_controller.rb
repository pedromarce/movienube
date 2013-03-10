class SearchController < ApplicationController

  def new

  end

  def create
  	@search = Search.new(params[:search])
  	bf = BadFruit.new('q5kk3jg9um8qt9sukxnv9yet')
  	if @search.valid?
  	 	@search.movies = bf.movies.search_by_name(@search.query,20)
  	 	if @search.movies.count > 0
  			render action: 'search'
  		else
  			redirect_to '/' 
  		end
  	else
  			redirect_to '/' 
  	end
  end
  
  def search

  end

  def torrent
  	@search = Search.new()
  	@search.torrents = JSON.parse(HTTParty.get('http://isohunt.com/js/json.php?' + { ihq: params[:search], rows: 20 }.to_query))['items']['list']
  	render action: 'torrent'
  end	

end

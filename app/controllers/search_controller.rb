class SearchController < ApplicationController

  def new

  end

  def create
  	@search = Search.new(params[:search])
  	bf = BadFruit.new('q5kk3jg9um8qt9sukxnv9yet')
  	if @search.valid?      
      if !@search.query.blank?
        @search.movies = bf.movies.search_by_name(@search.query,20)
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

  def list
    bf = BadFruit.new('q5kk3jg9um8qt9sukxnv9yet')
    @search = Search.new()
    @search.movies = bf.lists.send(params[:typeMethod]) if bf.lists.respond_to? params[:typeMethod]
    @search.typeList = params[:typeList]
    render action: 'list'
  end    

end

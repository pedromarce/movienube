class Search
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :query, :typeList

  def initialize(attributes = {})
  	attributes.each do |name, value|
  		send("#{name}=", value)
  	end
  end

  def persisted?
  	false
  end

  def movies=(movies)
  	@movies = movies
  end

  def movies()
  	@movies
  end

  def torrents=(torrents)
  	@torrents = torrents
  end

  def torrents()
  	@torrents
  end

end

class Api

    attr_accessor :query

    
    def initialize(query)
        @query = query
    end
    
    #into the url this method goes and iterates the nested hash information to pull the data 
    ## I created a fetch_articles method. Used JSON to parse the response and return the "articles" values key

    def fetch_articles
        url = "http://gateway.marvel.com/v1/public/events?ts=1&apikey=3680f361b8d959d4988267ff38f9a098&hash=4859dda6a24360f5044295209bc240df"
        uri = URI(url)
        #binding.pry
        response = Net::HTTP.get(uri)
        articles = JSON.parse(response)
        articles["data"]["results"][1..11]
    end
#I used this method to get the articles and parse them using Json
    def create_articles
        #binding.pry
        self.fetch_articles.each{|article| Article.new(article["title"], article["description"])}

    end

    def create_article
        self.fetch_article{|article| Article.new(article["resourceURI"])}


    end        

end




"let us pry"
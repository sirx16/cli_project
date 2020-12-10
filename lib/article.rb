 class Article
    attr_accessor :data, :results
    #I am creating readers and writers for these properties. I am recieving them from the API call
    @@all = []
    @@comics = []
    #binding.pry
    def initialize(data, results)
        @data = data
        @results = results
        # @input = input
        @@all << self
        #@@comics << input
    end

    def self.all
        @@all 
    end
    #binding.pry
    def comics
        @@comics
    end
#created this class method to clear the data from the screen once the user chooses to see other options
    def self.clear_all
        @@all = []
    end
    #i used this method to pull data from the create_articles method on api.rb
    def self.display_articles
        puts "Choose Your Reality:(1-11)"
        self.all.each_with_index{|article, index| puts "#{index + 1}. #{article.data}"}
        #binding.pry
    end



    def self.display_article(index)
        article = self.all[index]
         #binding.pry
        puts "#{article.data} -- #{article.results}"
        

        puts "Will you submit to this reality?"
        puts "1. Yea"
        puts "2. Nay"

        input = gets.chomp
        index = input.to_i - 1
        if index == 0
         @@comics << article
        end
        #binding.pry
        #     Launchy.open( URI ) do |exception|
        
    end
end

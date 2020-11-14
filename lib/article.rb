 class Article
    attr_accessor :data, :results
    @@all = []
    def initialize(data, results)
        @data = data
        @results = results
        @@all << self
    end
    def self.all
        @@all 
    end
    def self.clear_all
        @@all = []
    end
    def self.display_articles
        puts "Choose Your Reality:(1-6)"
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
            Launchy.open( URI ) do |exception|
        end
    end
end
end
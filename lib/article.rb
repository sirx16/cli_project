 class Article
    attr_accessor :data, :results
    #I am creating readers and writers for these properties. I am recieving them from the API call
    @@all = []
    def initialize(data, results)
        @data = data
        @results = results
        @@all << self
    end
#created class method to read the all array
#Self is a special variable. We use it within an instance method to refer to the class instance on which that method is being called. 
#In other words, the self variable points to the instance, or object, that the method is being called on.
#The data from one place (class) can be wrapped up in a method and sent off as a package to be delivered at a different part of the application (another class).
#Then, when the method is called in another place (another class), the package gets delivered and the return value is unwrapped at that place.
    def self.all
        @@all 
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
        #binding.pry
        # if index == 0
        #     Launchy.open( URI ) do |exception|
        
    end
end

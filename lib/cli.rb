class Cli
    @@category = ["Age of Apocalypse", "Acts of Vengeance!", "Dark Reign", "Days of Future Present"]
    def start
        puts "Salutations True Believer!"
        puts "CHOOSE YOUR DESTINY"
        self.display_category
        input = gets.chomp
        index = input_to_index(input)
        query = Cli.category[index]
        api = Api.new(query)
        api.create_articles
        Article.display_articles
        input = gets.chomp
        index = input_to_index(input)
        Article.display_article(index)
        self.another_article?
        #binding.pry
    end
    def input_to_index(input)
        input.to_i - 1
    end
    def another_article?
        puts "Would you like to enter another reality?"
        puts "1. Yea"
        puts "2. Nay"
        input = gets.chomp
        index = input_to_index(input)
        if index == 0
            Article.clear_all
            self.start
        end
end
    def self.category
        @@category
    end
    def display_category
        #binding.pry
        Cli.category.each_with_index{|category, index| puts"#{index+1}. #{category}"}
    end
end



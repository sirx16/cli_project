class Cli
    @@category = ["Villian", "Hero", "God", "Devil"]

    #This is the method that starts telling the program what to do.
    #The self.display_category in harken method is there so the application calls on it to input the information 
    #on category right after the user sees the message
    def harken
        puts "Salutations True Believer!"
        puts "I am Uatu the Watcher"
        puts "CHOOSE YOUR REPRESENTATION"
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
        #self tells the method to stay in its class
        
    end
        #grabs the users input and stores it before passing it to the method

        
    def input_to_index(input)
        input.to_i - 1
    end

    # def comics(index)
    #     index == 2
    #     self.comics(index)
    #             article = self.comics[index]
    #             puts "#{article.data} -- #{article.results}"
    # end
        

    def another_article?
        puts "Would you like to enter another reality?"
        puts "1. Yea"
        puts "2. Nay"
        puts "3. See which you've submitted to"
        input = gets.chomp
        index = input_to_index(input)
        if index == 0
            Article.clear_all
            self.harken
        elsif index == 2
             self.comics(index)
                article = self.comics[index]
                puts "#{article.data} -- #{article.results}"
        elsif index == 1
            goodbye
        end
    end
#binding.pry
    def save_input
        input = gets.chomp
        index = input.to_i - 1
        @@comics << article
    end

    def goodbye
        puts "You have conquered the battle! Til we meet again...."
        exit
    end

    def self.category
        @@category
    end
    def display_category
        #binding.pry
        Cli.category.each_with_index{|category, index| puts"#{index+1}. #{category}"}
    end
end
#In Ruby, a method provides functionality to an Object. A class method provides functionality to a class itself, 
#while an instance method provides functionality to one instance of a class.
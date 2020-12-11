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
        # Article.display_articles
        self.display_articles
        input = gets.chomp
        index = input_to_index(input)
        # Article.display_article(index)
        self.display_article(index)
        self.another_article?
        #self tells the method to stay in its class
    end
        #grabs the users input and stores it before passing it to the method
    def input_to_index(input)
        input.to_i - 1
    end
    def another_article?
        puts "Would you like to enter another reality?"
        puts "1. Yea"
        puts "2. Nay"
        # puts "3. See which you've submitted to"
        input = gets.chomp
        index = input_to_index(input)
        if index == 0
            Article.clear_all
            self.harken
        elsif index == 2
            article = Article.all[index]
            realities_array = []
            realities_array << article
            realities_array
            another_article?
        else index == 1
            goodbye
        end
    end
    def goodbye
        puts "You have conquered the battle! Til we meet again...."
        exit
    end
    def self.category
        @@category
    end
    def display_category
        Cli.category.each_with_index{|category, index| puts"#{index+1}. #{category}"}
    end
    def display_articles
        puts "Choose Your Reality:(1-11)"
        Article.all.each_with_index{|article, index| puts "#{index + 1}. #{article.data}"}
    end
    def display_article(index)
        article = Article.all[index]
        puts "#{article.data} -- #{article.results}"
        puts "Will you submit to this reality?(1-2)"
        puts "1. Yea"
        puts "2. Nay"
        puts "3. See which you've submitted to until now"
        input = gets.chomp
        index = input.to_i - 1
        realities_array = []
        if index = 0
        realities_array = []
        realities_array.push(article)
        realities_array.each do |article|
            puts "#{article.data} -- #{article.results}"
        end
            # binding.pry
        else index == 2
            puts realities_array
        end
    end
end
#In Ruby, a method provides functionality to an Object. A class method provides functionality to a class itself, 
#while an instance method provides functionality to one instance of a class.
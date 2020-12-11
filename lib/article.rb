class Article
    attr_accessor :data, :results, :description, :title
    attr_accessor :comics
    #I am creating readers and writers for these properties. I am recieving them from the API call
    @@all = []
    # @@comics = Array.new
    # @@comics = []
    def initialize(data, results)
        @data = data
        @results = results
        @description = description
        @comics = []
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

end





class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) } 
    validate :non_clickbait


    @@title_arr = [ /Won't Believe/, /Secret/, /Top[number]/, /Guess/ ]

    def non_clickbait
        # if @@title_arr.none? { |phrase| phrase.match(title) }
        #     errors.add(:title, "must be clickbait")
        # end

        if title
          if !!self.title.match?(/Won't Believe|Secret|Top \d|Guess/)
            # binding.pry
          # else 
        end
        errors.add(:title, "must be")
        end
    end

end

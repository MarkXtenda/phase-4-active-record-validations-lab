class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :checky

    private

    def checky
        if title.present? && title.include?('True Facts')
            if title != "You Won't Believe These True Facts"
                errors.add(:title, "can't include phrase: 'True Facts'")
            end
        end
    end

end

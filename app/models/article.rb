class Article < ActiveRecord::Base
  has_and_belongs_to_many :tags

  def tokenized_tags
    tags.map &:id
  end

  def tokenized_tags=(tokens) 
    tags.destroy_all
    tokens.each do |token| 
      tags << Tag.find(token)
    end
    save!
  end

end

class Article < ActiveRecord::Base
  has_and_belongs_to_many :tags

  def tokenized_tags
    self.tag_ids.join(',')
  end

  def tokenized_tags=(tokens) 
    self.tag_ids = tokens.split(',')
  end

end

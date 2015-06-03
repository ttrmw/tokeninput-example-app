require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'tokenized tags returns array of ids for relation' do 
    article = articles(:one)
    article.tags << tags(:one) 
    assert_equal [tags(:one).id], article.tokenized_tags
  end 

  test 'tokenized_tags= allows assignment of tags through tokens' do 
    article = articles(:one) 
    article.tokenized_tags = [tags(:one)]
    assert_equal [tags(:one)], article.tags
  end 
end

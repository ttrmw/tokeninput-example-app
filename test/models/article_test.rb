require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'tokenized tags returns array of ids for relation' do 
    article = articles(:one)
    article.tags << tags(:one)
    article.tags << tags(:two)
    assert_equal "#{tags(:one).id},#{tags(:two).id}", article.tokenized_tags
  end 

  test 'tokenized_tags= allows assignment of tags through tokens' do 
    article = articles(:one) 
    article.tokenized_tags = "#{tags(:one).id},#{tags(:two).id}"
    assert_equal [tags(:one), tags(:two)], article.tags
  end 
end

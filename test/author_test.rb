require 'minitest/autorun'
require 'minitest/pride'
require './lib/author'
require './lib/book'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
    })
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_has_attributes
    assert_equal [], @charlotte_bronte.books
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_it_can_write_a_book
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_instance_of Book, jane_eyre

    assert_equal "Jane Eyre", jane_eyre.title
    assert_equal [jane_eyre], @charlotte_bronte.books

    villette = @charlotte_bronte.write("Villette", "1853")

    assert_equal [jane_eyre, villette], @charlotte_bronte.books
  end
end

require "test/unit"

require "../episodes"

class TestEpisodes < Test::Unit::TestCase
  def test_should_list_all_episodes
    assert Episodes.all.size >= 9
  end
  
  def test_should_not_create_new_episodes_every_time
    assert_equal(Episodes.all, Episodes.all)
  end
  
  def test_when_asking_for_next_of_last_should_return_nil
    assert_nil Episodes.next(Episodes.all.last)
  end
  
  def test_should_return_next
    first = Episodes.all[0]
    second = Episodes.all[1]
    assert_equal(second, Episodes.next(first))
  end
  
  def test_episode_should_know_next_too
    first = Episodes.all[0]
    second = Episodes.all[1]
    assert_equal(second, first.next)
  end
end
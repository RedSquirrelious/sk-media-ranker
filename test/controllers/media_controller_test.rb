require 'test_helper'

class MediaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be able to create new album" do
    post_params = {medium: {maker: 'Bobbie Socks', title: 'Why Not?', kind: 'album', description: 'So tired'}}
    post :create, post_params
    assert_response :success
  end

  test "should get show" do
    get :show, {id: media(:flood).id}
    assert_response :success
  end

  test "should get show_albums" do
    get :show_albums
    assert_response :success
  end

  test "should get show_books" do
    get :show_books
    assert_response :success
  end

  test "should get show_movies" do
    get :show_movies
    assert_response :success
  end

  test "should be able to edit a book" do
    get :edit, {id: media(:flood).id}
    assert_response :success
  end

  test "should be able to update a book" do
    put :update, { id: media(:flowers_in_the_attic).id}
    assert_response :success
  end

  test "should be able to destroy a movie" do
    assert_difference("Medium.count", -1) do
      delete :destroy, {id: media(:harold_and_maude).id} 
      assert_response :redirect
    end
  end

#custom methods

  test "Upvote method Must Add Votes" do
    assert_difference("Vote.count", 1) do
      post :upvote, {id: media(:harold_and_maude).id}
      assert_response :redirect
    end
  end

  test 'Upvote Method Must Add Votes to Specific Medium' do
    test_case = media(:flowers_in_the_attic)
    test_case.votes.create
    assert_equal( test_case.votes.count, 1)
  end

  test 'Downvote Method Must Destroy Votes' do
    test_case = Medium.create(maker: 'Bobbi Sox', title: 'Why Not?', kind: 'album', description: 'So tired')
      test_case.votes.create

    assert_difference("Vote.count", -1) do
      get :downvote, {id: test_case.id}
      assert_response :redirect
    end

  end

end

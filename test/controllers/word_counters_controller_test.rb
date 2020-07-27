require 'test_helper'

class WordCountersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @word_counter = word_counters(:one)
  end

  test "should get index" do
    get word_counters_url
    assert_response :success
  end

  test "should get new" do
    get new_word_counter_url
    assert_response :success
  end

  test "should create word_counter" do
    assert_difference('WordCounter.count') do
      post word_counters_url, params: { word_counter: { input: @word_counter.input } }
    end

    assert_redirected_to word_counter_url(WordCounter.last)
  end

  test "should show word_counter" do
    get word_counter_url(@word_counter)
    assert_response :success
  end

  test "should get edit" do
    get edit_word_counter_url(@word_counter)
    assert_response :success
  end

  test "should update word_counter" do
    patch word_counter_url(@word_counter), params: { word_counter: { input: @word_counter.input } }
    assert_redirected_to word_counter_url(@word_counter)
  end

  test "should destroy word_counter" do
    assert_difference('WordCounter.count', -1) do
      delete word_counter_url(@word_counter)
    end

    assert_redirected_to word_counters_url
  end
end

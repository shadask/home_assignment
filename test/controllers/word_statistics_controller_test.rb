require 'test_helper'

class WordStatisticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @word_statistic = word_statistics(:one)
  end

  test "should get index" do
    get word_statistics_url
    assert_response :success
  end

  test "should get new" do
    get new_word_statistic_url
    assert_response :success
  end

  test "should create word_statistic" do
    assert_difference('WordStatistic.count') do
      post word_statistics_url, params: { word_statistic: { count: @word_statistic.count, word: @word_statistic.word } }
    end

    assert_redirected_to word_statistic_url(WordStatistic.last)
  end

  test "should show word_statistic" do
    get word_statistic_url(@word_statistic)
    assert_response :success
  end

  test "should get edit" do
    get edit_word_statistic_url(@word_statistic)
    assert_response :success
  end

  test "should update word_statistic" do
    patch word_statistic_url(@word_statistic), params: { word_statistic: { count: @word_statistic.count, word: @word_statistic.word } }
    assert_redirected_to word_statistic_url(@word_statistic)
  end

  test "should destroy word_statistic" do
    assert_difference('WordStatistic.count', -1) do
      delete word_statistic_url(@word_statistic)
    end

    assert_redirected_to word_statistics_url
  end
end

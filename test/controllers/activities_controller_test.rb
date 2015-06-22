require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  setup do
    @activity = activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activities)
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  #
  # test "should create activity" do
  #   assert_difference('Activity.count') do
  #     post :create, activity: { category_id: @activity.category_id,
  #         description: @activity.description, due_date: @activity.due_date,
  #         name: @activity.name, priority: @activity.priority }
  #   end
  #
  #   assert_redirected_to root_path
  # end

  test "should show activity" do
    get :show, id: @activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity
    assert_response :success
  end

  test "should update activity" do
    patch :update, id: @activity, activity: { category_id: @activity.category_id,
        description: @activity.description, due_date: @activity.due_date,
        name: @activity.name, priority: @activity.priority }
    assert_redirected_to root_path
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete :destroy, id: @activity
    end

    assert_redirected_to activities_path
  end
end

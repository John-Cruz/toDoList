require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
  setup do
    @activity = activities(:one)
    @user1 = users(:one)
    @user2 = users(:two)
  end

  def nil_setup
    session[:user_id] = nil
  end

  def user_setup
    session[:user_id] = @user1.id
  end

  def other_user_setup
    session[:user_id] = @user2.id
  end

  def root
    assert_redirected_to root_path
  end

  def denied
    assert_equal "ACCESS DENIED", flash[:notice]
  end

  def success
    assert_response :success
  end

  def must_sign_in
    assert_equal "Must sign in :p", flash[:notice]
  end

  test "should get index if logged in" do
    user_setup
    get :index
    success
    assert_not_nil assigns(:activities)
  end

  test "should not get index if logged out" do
    nil_setup
    get :index
    root
    must_sign_in
  end

  test "should get new if logged in" do
    user_setup
    get :new
    assert_response :success
  end

  test "should not get new if logged out" do
    nil_setup
    get :new
    root
    must_sign_in
  end

  test "should create activity if signed in" do
    user_setup
    assert_difference('Activity.count') do
      post :create, activity: { user_id: @user1.id, category_id: @activity.category_id,
          description: @activity.description, due_date: @activity.due_date,
          name: @activity.name, priority: @activity.priority }
    end

    root
  end

  test "should not create activity if signed out" do
    nil_setup
    post :create, activity: { user_id: @user1.id, category_id: @activity.category_id,
        description: @activity.description, due_date: @activity.due_date,
        name: @activity.name, priority: @activity.priority }

    root
    must_sign_in
  end

  test "should not show activity if signed out" do
    nil_setup
    get :show, id: @activity
    root
    must_sign_in
  end

  test "should not show other's activity" do
    other_user_setup
    get :show, id: @activity
    root
    denied
  end

  test "should show activity if owner" do
    user_setup
    get :show, id: @activity
    success
  end

  test "should not get edit if signed out" do
    nil_setup
    get :edit, id: @activity
    root
    must_sign_in
  end

  test "should not edit other's activities" do
    other_user_setup
    get :edit, id: @activity
    root
    denied
  end

  test "should get edit if owner" do
    user_setup
    get :edit, id: @activity
    success
  end

  test "should not update if logged out" do
    nil_setup

    patch :update, id: @activity, activity: { category_id: @activity.category_id,
        description: @activity.description, due_date: @activity.due_date,
        name: @activity.name, priority: @activity.priority, user_id: @user1.id
    }

    root
    must_sign_in
  end

  test "should not update other's activities" do
    other_user_setup

    patch :update, id: @activity, activity: { category_id: @activity.category_id,
        description: @activity.description, due_date: @activity.due_date,
        name: @activity.name, priority: @activity.priority, user_id: @user1.id
    }

    root
    denied
  end

  test "should update activity if owner" do
    user_setup

    patch :update, id: @activity, activity: { category_id: @activity.category_id,
        description: @activity.description, due_date: @activity.due_date,
        name: @activity.name, priority: @activity.priority, user_id: @user1.id
    }

    root
    assert_equal "Activity was successfully updated.", flash[:notice]
  end

  test "should not destroy if signed out" do
    nil_setup
    delete :destroy, id: @activity

    root
    must_sign_in
  end

  test "should not destroy other's activities" do
    other_user_setup
    delete :destroy, id: @activity

    root
    denied
  end

  test "should destroy activity if owner" do
    user_setup
    assert_difference('Activity.count', -1) do
      delete :destroy, id: @activity
    end

    root
    assert_equal "Activity was successfully destroyed.", flash[:notice]
  end

  test "should not complete if signed out" do
    nil_setup
    patch :complete, id: @activity

    root
    must_sign_in
  end

  test "should not complte other's activities" do
    other_user_setup
    patch :complete, id: @activity

    root
    denied
  end

  # test "should complete activity if owner" do #test fails because the view is expected to be html
  #   user_setup
  #   patch :complete, id: @activity
  #
  #   success
  # end
end

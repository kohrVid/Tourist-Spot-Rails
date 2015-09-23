require 'test_helper'

class CarouselsControllerTest < ActionController::TestCase
  setup do
    @carousel = carousels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carousels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carousel" do
    assert_difference('Carousel.count') do
      post :create, carousel: { image_description: @carousel.image_description, image_url: @carousel.image_url }
    end

    assert_redirected_to carousel_path(assigns(:carousel))
  end

  test "should show carousel" do
    get :show, id: @carousel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @carousel
    assert_response :success
  end

  test "should update carousel" do
    patch :update, id: @carousel, carousel: { image_description: @carousel.image_description, image_url: @carousel.image_url }
    assert_redirected_to carousel_path(assigns(:carousel))
  end

  test "should destroy carousel" do
    assert_difference('Carousel.count', -1) do
      delete :destroy, id: @carousel
    end

    assert_redirected_to carousels_path
  end
end

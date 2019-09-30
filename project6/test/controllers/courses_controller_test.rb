require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get courses_url
    assert_response :redirect
  end


  test "should show course" do
    get course_url(@course)
    assert_response :redirect
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :redirect
  end

  test "should not save course without user_id" do 
    course = Course.new
    assert_not course.save
  end 

  test "should report error" do 
    assert_raises(NameError) do
      some_undefined_variable 
    end 
  end 

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end

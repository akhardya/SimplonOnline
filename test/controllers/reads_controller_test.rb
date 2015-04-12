require 'test_helper'

class ReadsControllerTest < ActionController::TestCase

	def setup_with(student_type)
    	@user = FactoryGirl.create(:user, student_type: student_type)
    	session[:user_id] = @user.id
  	end

	test "create" do
		setup_with(User::REMOTE)
		lesson = FactoryGirl.create(:lesson, {online: true})
		chapter = FactoryGirl.create(:chapter, {lesson: lesson})
		post :create, lesson_id: lesson, chapter_id: chapter
    	assert_redirected_to lesson_chapter_path(lesson, chapter)
	end
end
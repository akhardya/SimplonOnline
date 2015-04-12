class ReadsController < ApplicationController
	skip_filter :remote_cant_access

	def create
		lesson = Lesson.find(params[:lesson_id])
   		chapter = lesson.chapters.find(params[:chapter_id])
    	redirect_to lesson_chapter_path(lesson, chapter)
	end 
end
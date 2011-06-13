class HomeController < ApplicationController
	require 'fileutils'
	require 'hpricot'
    
	def index
	end

	def create
		tmp = params[:upload][:my_file].tempfile
		file = File.join("public", params[:upload][:my_file].original_filename)
		FileUtils.cp tmp.path, file
		@file_name = params[:upload][:my_file].original_filename
		puts params[:upload][:my_file].original_filename
		parse_xml(@file_name)
	end
  
	def parse_xml(filename)
		doc = Hpricot(open(Rails.root + "public/#{@file_name}"))    
		(doc/'curriculums/row').each do |e|
			group_id = (e/'group_id').inner_html
			subject_id = (e/'subject_id').inner_html
			subject_type = (e/'subject_type').inner_html
			pool_name = (e/'pool_name').inner_html
			cur = Curriculum.new(:group_id => group_id, :subject_id => subject_id, :subject_type => subject_type, :pool_name => pool_name)
			cur.save
		end
		
		(doc/'divisions/row').each do |e|
			grade_id = (e/'grade_id').inner_html
			name = (e/'name').inner_html
			div = Division.new(:grade_id => grade_id, :name => name)
			div.save
		end
		
		(doc/'divisions_groups/row').each do |e|
			division_id = (e/'division_id').inner_html
			group_id = (e/'group_id').inner_html
			dgro = DivisionsGroup.new(:division_id => division_id, :group_id => group_id)
			dgro.save
		end

		(doc/'enrolments/row').each do |e|
			group_id = (e/'group_id').inner_html
			subject_id = (e/'subject_id').inner_html
			student_id = (e/'student_id').inner_html
			curriculum_id = (e/'curriculum_id').inner_html
			enr = Enrolment.new(:group_id => group_id, :subject_id => subject_id, :student_id => student_id, :curriculum_id => curriculum_id)
			enr.save
		end

		(doc/'exams/row').each do |e|
			school_id = (e/'school_id').inner_html
			start_date = (e/'start_date').inner_html
			name = (e/'name').inner_html
			created_at = (e/'created_at').inner_html
			updated_at = (e/'updated_at').inner_html
			term = (e/'term').inner_html
			end_date = (e/'end_date').inner_html
			exam_type = (e/'exam_type').inner_html
			creator_id = (e/'creator_id').inner_html
			edit_mode = (e/'edit_mode').inner_html
			exa = Exam.new(:school_id => school_id, :start_date => start_date, :name => name, :created_at => created_at, :updated_at => updated_at, :term => term, :end_date => end_date, :exam_type=> exam_type, :creator_id => creator_id, :edit_mode => edit_mode)
			exa.save
		end
		
		(doc/'grades/row').each do |e|
			school_id = (e/'school_id').inner_html
			grade_order = (e/'grade_order').inner_html
			name = (e/'name').inner_html
			gra = Grade.new(:school_id => school_id, :grade_order => grade_order, :name => name)
			gra.save
		end
		
		(doc/'groups/row').each do |e|
			name = (e/'name').inner_html
			school_id = (e/'school_id').inner_html
			gro = Group.new(:name => name, :school_id => school_id)
			gro.save
		end

		(doc/'marks/row').each do |e|
			paper_id = (e/'paper_id').inner_html
			score = (e/'score').inner_html
			student_id = (e/'student_id').inner_html
			letter_grade = (e/'letter_grade').inner_html
			orig_score = (e/'orig_score').inner_html
			mar = Mark.new(:paper_id => paper_id, :score => score, :student_id => student_id, :letter_grade => letter_grade, :orig_score => orig_score)
			mar.save
		end
		
		(doc/'papers/row').each do |e|
			grade_id = (e/'grade_id').inner_html
			subject_id = (e/'subject_id').inner_html
			exam_id = (e/'exam_id').inner_html
			max_mark = (e/'max_mark').inner_html
			max_grade = (e/'max_grade').inner_html
			date = (e/'date').inner_html
			division_id = (e/'division_id').inner_html
			curriculum_id = (e/'curriculum_id').inner_html
			par = Paper.new(:grade_id => grade_id, :subject_id => subject_id, :exam_id => exam_id, :max_mark => max_mark, :max_grade =>max_grade, :date => date, :division_id => division_id, :curriculum_id => curriculum_id)
			par.save
		end
		
		(doc/'schools/row').each do |e|
			name = (e/'name').inner_html
			subdomain = (e/'subdomain').inner_html
			logo_file_name = (e/'logo_file_name').inner_html
			logo_content_type = (e/'logo_content_type').inner_html
			logo_file_size = (e/'logo_file_size').inner_html
			logo_updated_at = (e/'logo_updated_at').inner_html
			created_at = (e/'created_at').inner_html
			updated_at = (e/'updated_at').inner_html
			board = (e/'board').inner_html
			sch = School.new(:name => name, :subdomain => subdomain, :logo_file_name => logo_file_name, :logo_content_type => logo_content_type, :logo_file_size => logo_file_size, :logo_updated_at => logo_updated_at, :created_at => created_at, :updated_at => updated_at, :board => board)
			sch.save
		end

		(doc/'students/row').each do |e|
			name = (e/'name').inner_html
			school_id = (e/'school_id').inner_html
			grade_id = (e/'grade_id').inner_html
			division_id = (e/'division_id').inner_html
			roll_no = (e/'roll_no').inner_html
			group_id = (e/'group_id').inner_html
			stu = Student.new(:name => name, :school_id => school_id, :grade_id => grade_id, :division_id => division_id, :roll_no => roll_no, :group_id =>group_id )
			stu.save
		end
		
		
		(doc/'subjects/row').each do |e|
			school_id = (e/'school_id').inner_html
			name = (e/'name').inner_html
			sub = Subject.new(:school_id => school_id, :name => name)
			sub.save
		end

		(doc/'syllabuses/row').each do |e|
			sy = Syllabuse.new()
			sy.save
		end
	end
end

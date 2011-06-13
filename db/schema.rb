# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110611134508) do

  create_table "curriculums", :force => true do |t|
    t.integer "group_id"
    t.integer "subject_id"
    t.string  "subject_type"
    t.string  "pool_name"
  end

  create_table "divisions", :force => true do |t|
    t.integer "grade_id"
    t.string  "name"
  end

  create_table "divisions_groups", :force => true do |t|
    t.integer "division_id"
    t.integer "group_id"
  end

  create_table "enrolments", :force => true do |t|
    t.integer "group_id"
    t.integer "subject_id"
    t.integer "student_id"
    t.integer "curriculum_id"
  end

  create_table "exams", :force => true do |t|
    t.integer "school_id"
    t.date    "start_date"
    t.string  "name"
    t.string  "term"
    t.date    "end_date"
    t.integer "edit_mode"
    t.integer "creator_id"
    t.string  "exam_type"
  end

  create_table "grades", :force => true do |t|
    t.integer "school_id"
    t.integer "grade_order"
    t.integer "name"
  end

  create_table "groups", :force => true do |t|
    t.string  "name"
    t.integer "school_id"
  end

  create_table "marks", :force => true do |t|
    t.integer "paper_id"
    t.integer "score"
    t.integer "student_id"
    t.integer "letter_grade"
    t.integer "orig_score"
  end

  create_table "papers", :force => true do |t|
    t.integer "grade_id"
    t.integer "subject_id"
    t.integer "exam_id"
    t.integer "max_mark"
    t.integer "max_grade"
    t.date    "date"
    t.integer "division"
    t.integer "curriculum_id"
  end

  create_table "schools", :force => true do |t|
    t.string "subdomain"
    t.string "name"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.date   "logo_updated_at"
    t.string "board"
  end

  create_table "students", :force => true do |t|
    t.string  "name"
    t.integer "school_id"
    t.integer "grade_id"
    t.integer "division_id"
    t.integer "roll_no"
    t.integer "group_id"
  end

  create_table "subjects", :force => true do |t|
    t.integer "school_id"
    t.string  "name"
  end

  create_table "syllabuses", :force => true do |t|
  end

end

class CreateTables < ActiveRecord::Migration
    def self.up
        create_table :curriculums do |t|
            t.integer :group_id
            t.integer :subject_id
            t.string :subject_type
            t.string :pool_name
        end
       
         create_table :divisions do |t|
            t.integer :grade_id
            t.string :name
        end

        create_table :divisions_groups do |t|
            t.integer :division_id
            t.integer :group_id
        end
        
        create_table :enrolments do |t|
            t.integer :group_id
            t.integer :subject_id
            t.integer :student_id
            t.integer :curriculum_id
        end
        
        create_table :exams do |t|
            t.integer :school_id
            t.date :start_date
            t.string :name
	    t.date :created_at
	    t.date :updated_at
            t.string :term
            t.date :end_date
            t.integer :edit_mode
            t.integer :creator_id
            t.string :exam_type
        end

        create_table :grades do |t|
            t.integer :school_id
            t.integer :grade_order
            t.integer :name
        end
        
         create_table :groups do |t|
            t.string :name
            t.integer :school_id
        end
        
         create_table :marks do |t|
            t.integer :paper_id
            t.integer :score
            t.integer :student_id
            t.integer :letter_grade
            t.integer :orig_score
        end
            
        create_table :papers do |t|
            t.integer :grade_id
            t.integer :subject_id
            t.integer :exam_id
            t.integer :max_mark
            t.integer :max_grade
            t.date :date
            t.integer :division_id
            t.integer :curriculum_id
        end
        
        create_table :schools do |t|
            t.string :subdomain
            t.string :name
            t.string :logo_file_name
            t.string :logo_content_type
            t.date :logo_updated_at
            t.string :board
            t.string :logo_file_size
	    t.date :created_at
	    t.date :updated_at
        end

        create_table :students do |t|
            t.string :name
            t.integer :school_id
            t.integer :grade_id
            t.integer :division_id
            t.integer :roll_no
            t.integer :group_id
        end   
        
        create_table :subjects do |t|
            t.integer :school_id
            t.string :name
        end
        
        create_table :syllabuses do |t|
        end
        
    end
    
    def self.down
    end
    
end

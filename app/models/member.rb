class Member < ActiveRecord::Base

  MAJORS = ['Accounting', 'Africana Studies', 'Anthropology', 'Architecture', 'Art', 'Art History', 'Athletic Training', 'Biology', 'Business Administration', 'Chemistry', 'Child and Family Development', 'Civil Engineering', 'Civil Engineering Technology', 'Computer Science', 'Computer Engineering', 'Construction Management', 'Criminal Justice', 'Dance', 'Earth and Environmental Sciences', 'Economics', 'Electrical Engineering', 'Electrical Engineering Technology', 'Elementary Education', 'English', 'Environmental Studies', 'Exercise Science', 'Finance', 'Fire Safety Engineering Technology', 'French', 'Geography', 'Geology', 'German', 'History', 'International Business', 'International Studies', 'Japanese', 'Latin American Studies', 'Management', 'Management Information Systems', 'Marketing', 'Mathematics', 'Mathematics for Business', 'Mechanical Engineering', 'Mechanical Engineering Technology', 'Meteorology', 'Middle Grades Education', 'Music', 'Neurodiagnostics and Sleep Science', 'Nursing', 'Ops & Supply Chain Management', 'Pre-Law', 'Philosophy', 'Physics', 'Political Science', 'Psychology', 'Public Health', 'Religious Studies', 'Respiratory Therapy', 'Social Work', 'Sociology', 'Spanish', 'Special Education', 'Systems Engineering', 'Theatre']
  POSITIONS = ['President', 'Vice President', 'Treasurer', 'Secretary', 'Strategic Advisor', 'Director of Strategic Partnerships', 'Director of Programs', 'Director of Public Relations', 'Director of Publications', 'Director of Community Service', 'Director of Fundraising', 'Historian', 'Digital Administrator']
  GRAD_MONTHS = ['May', 'December']

	validates_presence_of :first_name, message: 'Please enter your first name'
	validates_presence_of :last_name, message: 'Please enter your last name'
  validates_presence_of :avatar, message: 'If you are creating a new executive, you must attach a photo', on: :create
  validates_format_of :email, with: /\A\w+@\w+\.\w+\Z/i, message: 'Please enter a valid email address'
  validates :major, inclusion: { in: MAJORS, allow_blank: false, message: 'Please enter a major' }
  validates :executive_position, inclusion: { in: POSITIONS, allow_blank: false, message: 'An executive must have a position!' }

  has_attached_file :avatar, styles: {
      thumb: ['100x100#',  :jpg, :quality => 70],
      preview: ['480x480#',  :jpg, :quality => 70],
      large:['600>',      :jpg, :quality => 70]
    },
    convert_options: {
      thumb: '-set colorspace sRGB -strip',
      preview: '-set colorspace sRGB -strip',
      large: '-set colorspace sRGB -strip'
    }

  validates_attachment :avatar,
    size: { in: 0..10.megabytes },
    content_type: { content_type: /^image\/(jpeg|png|gif|tiff)$/ }
end

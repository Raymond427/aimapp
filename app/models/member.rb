class Member < ActiveRecord::Base

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

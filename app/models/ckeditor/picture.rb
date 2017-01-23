class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :processors => [:watermark],
                    :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :styles => {
                        :thumb => '118x100#',
                        :content => {
                            :geometry => '900>',
                            :watermark_path => "#{Rails.root}/public/images/watermark.png",
                            :position => 'Center'
                        },
                    }

  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 2.megabytes
  validates_attachment_content_type :data, content_type: /\Aimage/

  def url_content
    url(:content)
  end
end

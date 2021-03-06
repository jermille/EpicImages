class Admin::TagsController < Admin::AdminController

  def show
    @gallery = Tag.gallery.where('LOWER(name) = ?', filtered_id).first
  end

  def create
    params[:tags].split(',').each do |tag|
      tag = Tag.where(name: tag).first_or_initialize
      tag.update_attributes(gallery_flag: true) if params[:gallery].present?
      tag.save unless params[:gallery].present?
    end

    redirect_to admin_photos_path
  end

  def photos
    @photos = Tag.find(params[:id]).photos
    render partial: 'admin/photos/photos', locals: { photos: @photos }, formats: [:json]
  end

  private

    def filtered_id
      params[:id].gsub('-', ' ')
    end
end
class Image
  def resize_to(file, dimensions)
    image = MiniMagick::Image.read(file)
    image.resize(dimensions)
    image.to_blob
  end
end
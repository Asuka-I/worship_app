class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # デフォルト画像の表示
  def default_url(*_args)
    #   # For Rails 3.1+ asset pipeline compatibility:
    #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    "/images/fallback/#{[version_name, 'default.jpg'].compact.join('_')}"
  end

  # サムネイル画像を表示
  version :thumb do
    process resize_to_fit: [300, 180]
  end

  # 画像サイズ
  # 画像が大きい場合のみリサイズ
  # process resize_to_limit: [400, 400]

  # 画像が小さい場合もリサイズ
  # process resize_to_fit: [1000, 1000]

  # 指定サイズで切り抜く
  process resize_to_fill: [400, 400]

  # ファイル形式の制限
  def extension_allowlist
    %w[jpg jpeg gif png heic]
  end

  # ファイルサイズの上限
  def size_range
    1..(10.megabytes)
  end

  # jpg に変換
  process convert: "jpg"

  # ファイル名の拡張子を jpg に変更
  def filename
    "#{super.chomp(File.extname(super))}.jpg" if original_filename.present?
  end

  # ファイル名をランダムに変更
  # def filename
  #   "#{secure_token}.#{file.extension}" if original_filename.present?
  # end

  # protected

  # def secure_token
  #   var = :"@#{mounted_as}_secure_token"
  #   model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  # end
end

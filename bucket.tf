# Создание бакета Object Storage
resource "yandex_storage_bucket" "bucket" {
  bucket        = var.bucket_name
  folder_id     = var.folder_id
}

# Загрузка картинки в бакет
resource "yandex_storage_object" "picture" {
  bucket     = var.bucket_name
  key        = "picture.jpg"
  source     = var.image_path
  acl        = "public-read"
  depends_on = [yandex_storage_bucket.bucket]
}
email = "test@example.com"
password = "password"

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: email) do |u|
  u.password = password
  puts "ユーザーの初期データインポートに成功しました。"
end

# users テーブルを再生成（関連付いたテーブルを含む）
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")

# 以下，開発用の初期データ
user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

puts "ユーザデータの投入に成功しました！"

# worship1 = user1.worships.create!(category: "寺", prefecture_id: "", place: "寒川神社", content: "いつも年末年始にお世話になっています", date: "2021/09/17")
# worship2 = user2.worships.create!(category: "神社", prefecture_id: "", place: "諏訪大社", content: "見応えがあり、社ごとに雰囲気が違ってゆっくり楽しめた。", date: "2021/09/13")
# worship3 = user3.worships.create!(category: "寺", prefecture_id: "", place: "常泉寺", content: "彼岸花が咲き誇り、とても美しいお寺。河童さんが沢山いた！", date: "2021/09/08")

# puts "worshipsデータの投入に成功しました！"

# seal1 = user1.seals.create!(category: "寺", prefecture_id: "", place: "寒川神社", date: "2021/09/17")
# seal2 = user2.seals.create!(category: "神社", prefecture_id: "", place: "諏訪大社", date: "2021/09/13")
# seal3 = user3.seals.create!(category: "寺", prefecture_id: "", place: "常泉寺", date: "2021/09/08")

# puts "sealsデータの投入に成功しました！"

# worship1.worship_likes.create!(user_id: user1.id)
# worship3.worship_likes.create!(user_id: user3.id)
# worship2.worship_likes.create!(user_id: user3.id)
# worship2.worship_likes.create!(user_id: user1.id)

# puts "worship_likeデータの投入に成功しました！"

# seal1.seal_likes.create!(user_id: user1.id)
# seal3.seal_likes.create!(user_id: user3.id)
# seal2.seal_likes.create!(user_id: user3.id)
# seal2.seal_likes.create!(user_id: user1.id)

# puts "seal_likeデータの投入に成功しました！"

# ログイン時に使用するアカウント（変数への代入は不要）
User.create!(email: email, password: password)

puts "初期データの投入に成功しました！"

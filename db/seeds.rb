email = "test@example.com"
password = "password"

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: email) do |u|
  u.password = password
  puts "ユーザーの初期データインポートに成功しました。"
end

# 初期データ
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE worships RESTART IDENTITY CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE seals RESTART IDENTITY CASCADE")

user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

Seal.create!(category: "寺", title: "浅草寺", place: "神奈川県寒川市", date: "2021/09/17", user_id: user2.id)
Seal.create!(category: "神社", title: "諏訪神社", place: "長野県諏訪市", date: "2021/09/13", user_id: user3.id)
Seal.create!(category: "寺", title: "常泉寺", place: "神奈川大和市", date: "2021/09/08", user_id: user3.id)

puts "初期データの投入に成功しました！"

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

user1.worships.create!(category: "寺", title: "浅草寺", place: "神奈川県寒川市", content: "いつも年末年始にお世話になっています", date: "2021/09/17")
user2.worships.create!(category: "神社", title: "諏訪神社", place: "長野県諏訪市", content: "見応えがあり、社ごとに雰囲気が違ってゆっくり楽しめた。", date: "2021/09/13")
user3.worships.create!(category: "寺", title: "常泉寺", place: "神奈川大和市", content: "彼岸花が咲き誇り、とても美しいお寺。河童さんが沢山いた！", date: "2021/09/08")

user1.seals.create!(category: "寺", title: "浅草寺", place: "神奈川県寒川市", date: "2021/09/17")
user2.seals.create!(category: "神社", title: "諏訪神社", place: "長野県諏訪市", date: "2021/09/13")
user3.seals.create!(category: "寺", title: "常泉寺", place: "神奈川大和市", date: "2021/09/08")

# ログイン時に使用するアカウント（変数への代入は不要）
User.create!(email: email, password: password)

puts "初期データの投入に成功しました！"

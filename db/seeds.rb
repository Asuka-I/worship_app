email = "test@example.com"
password = "password"

user = User.first
Worship.create!(category: "神社", title: "寒川神社", place: "神奈川県寒川市", date: "2021/08/22", content: "毎年、年末年始にお参りします！いつもお世話になっている神社です。", user_id: user.id)
puts "初期データの投入に成功しました！"

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: email) do |u|
  u.password = password
  puts "ユーザーの初期データインポートに成功しました。"
end

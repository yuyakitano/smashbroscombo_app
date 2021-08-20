# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Command.find_or_create_by!(name: "ジャンプ") do |command|
  command.name = "ジャンプ" 
Command.find_or_create_by!(name: "小ジャンプ") do |command|
  command.name = "小ジャンプ" 
Command.find_or_create_by!(name: "大ジャンプ") do |command|
  command.name = "大ジャンプ" 
Command.find_or_create_by!(name: "A") do |command|
  command.name = "A" 
Command.find_or_create_by!(name: "上強攻撃") do |command|
  command.name = "上強攻撃" 
Command.find_or_create_by!(name: "下強攻撃") do |command|
  command.name = "下強攻撃" 
Command.find_or_create_by!(name: "前強攻撃") do |command|
  command.name = "前強攻撃" 
Command.find_or_create_by!(name: "後強攻撃") do |command|
  command.name = "後強攻撃" 
Command.find_or_create_by!(name: "空NA") do |command|
  command.name = "空NA" 
Command.find_or_create_by!(name: "空上A") do |command|
  command.name = "空上A" 
Command.find_or_create_by!(name: "空下A") do |command|
  command.name = "空下A" 
Command.find_or_create_by!(name: "空前A") do |command|
  command.name = "空前A" 
Command.find_or_create_by!(name: "空後A") do |command|
  command.name = "空後A" 
Command.find_or_create_by!(name: "B") do |command|
  command.name = "B" 
Command.find_or_create_by!(name: "上B") do |command|
  command.name = "上B" 
Command.find_or_create_by!(name: "下B") do |command|
  command.name = "下B" 
Command.find_or_create_by!(name: "前横B") do |command|
  command.name = "前横B" 
Command.find_or_create_by!(name: "後横B") do |command|
  command.name = "後横B" 
Command.find_or_create_by!(name: "空NB") do |command|
  command.name = "空NB" 
Command.find_or_create_by!(name: "空上B") do |command|
  command.name = "空上B" 
Command.find_or_create_by!(name: "空下B") do |command|
  command.name = "空下B" 
Command.find_or_create_by!(name: "空前横B") do |command|
  command.name = "空前横B" 
Command.find_or_create_by!(name: "空後横B") do |command|
  command.name = "空後横B" 
Command.find_or_create_by!(name: "低空ヒット") do |command|
  command.name = "低空ヒット" 
Command.find_or_create_by!(name: "次") do |command|
  command.name = "次" 
Command.find_or_create_by!(name: "前投げ") do |command|  
  command.name = "前投げ" 
Command.find_or_create_by!(name: "後投げ") do |command|
  command.name = "後投げ" 
Command.find_or_create_by!(name: "上投げ") do |command|
  command.name = "上投げ" 
Command.find_or_create_by!(name: "下投げ") do |command|
  command.name = "下投げ" 

# Command.create(name: "ジャンプ") 
# Command.create(name: "小ジャンプ") 
# Command.create(name: "大ジャンプ") 
# Command.create(name: "A") 
# Command.create(name: "上強攻撃") 
# Command.create(name: "下強攻撃") 
# Command.create(name: "前強攻撃") 
# Command.create(name: "後強攻撃") 
# Command.create(name: "空NA") 
# Command.create(name: "空上A") 
# Command.create(name: "空下A") 
# Command.create(name: "空前A") 
# Command.create(name: "空後A") 
# Command.create(name: "B") 
# Command.create(name: "上B") 
# Command.create(name: "下B") 
# Command.create(name: "前横B") 
# Command.create(name: "後横B") 
# Command.create(name: "空NB") 
# Command.create(name: "空上B") 
# Command.create(name: "空下B") 
# Command.create(name: "空前横B") 
# Command.create(name: "空後横B")
# Command.create(name: "低空ヒット")
# Command.create(name: "次") 
# Command.create(name: "前投げ") 
# Command.create(name: "後投げ") 
# Command.create(name: "上投げ") 
# Command.create(name: "下投げ") 
Fighter.create(fighter_id:1, name: "マリオ", fighter_image: File.open("./app/assets/images/1.jpeg")) 
Fighter.create(fighter_id:2, name: "ドンキーコング", fighter_image: File.open("./app/assets/images/2.jpeg")) 
Fighter.create(fighter_id:3, name: "リンク", fighter_image: File.open("./app/assets/images/3.jpeg")) 
Fighter.create(fighter_id:4, name: "サムス.ダークサムス", fighter_image: File.open("./app/assets/images/4.jpeg"))
Fighter.create(fighter_id:5, name: "ヨッシー", fighter_image: File.open("./app/assets/images/5.jpeg"))
Fighter.create(fighter_id:6, name: "カービィ", fighter_image: File.open("./app/assets/images/6.jpeg"))
Fighter.create(fighter_id:7, name: "フォックス", fighter_image: File.open("./app/assets/images/7.jpeg"))
Fighter.create(fighter_id:8, name: "ピカチュウ", fighter_image: File.open("./app/assets/images/8.jpeg"))
Fighter.create(fighter_id:9, name: "ルイージ", fighter_image: File.open("./app/assets/images/9.jpeg"))
Fighter.create(fighter_id:10, name: "ネス", fighter_image: File.open("./app/assets/images/10.jpeg"))
Fighter.create(fighter_id:11, name: "キャプテン・ファルコン", fighter_image: File.open("./app/assets/images/11.jpeg"))
Fighter.create(fighter_id:12, name: "プリン", fighter_image: File.open("./app/assets/images/12.jpeg"))
Fighter.create(fighter_id:13, name: "ピーチ.デイジー", fighter_image: File.open("./app/assets/images/13.jpeg"))
Fighter.create(fighter_id:14, name: "クッパ", fighter_image: File.open("./app/assets/images/14.jpeg"))
Fighter.create(fighter_id:15, name: "アイスクライマー", fighter_image: File.open("./app/assets/images/15.jpeg"))
Fighter.create(fighter_id:16, name: "シーク", fighter_image: File.open("./app/assets/images/16.jpeg"))
Fighter.create(fighter_id:17, name: "ゼルダ", fighter_image: File.open("./app/assets/images/17.jpeg"))
Fighter.create(fighter_id:18, name: "ドクターマリオ", fighter_image: File.open("./app/assets/images/18.jpeg"))
Fighter.create(fighter_id:19, name: "ピチュー", fighter_image: File.open("./app/assets/images/19.jpeg"))
Fighter.create(fighter_id:20, name: "ファルコ", fighter_image: File.open("./app/assets/images/20.jpeg"))
Fighter.create(fighter_id:21, name: "マルス", fighter_image: File.open("./app/assets/images/21.jpeg"))
Fighter.create(fighter_id:22, name: "ルキナ", fighter_image: File.open("./app/assets/images/22.jpeg"))
Fighter.create(fighter_id:23, name: "こどもリンク", fighter_image: File.open("./app/assets/images/23.jpeg"))
Fighter.create(fighter_id:24, name: "ガノンドロフ", fighter_image: File.open("./app/assets/images/24.jpeg"))
Fighter.create(fighter_id:25, name: "ミュウツー", fighter_image: File.open("./app/assets/images/25.jpeg"))
Fighter.create(fighter_id:26, name: "ロイ", fighter_image: File.open("./app/assets/images/26.jpeg"))
Fighter.create(fighter_id:27, name: "クロム", fighter_image: File.open("./app/assets/images/27.jpeg"))
Fighter.create(fighter_id:28, name: "Mr.ゲーム＆ウォッチ", fighter_image: File.open("./app/assets/images/28.jpeg"))
Fighter.create(fighter_id:29, name: "メタナイト", fighter_image: File.open("./app/assets/images/29.jpeg"))
Fighter.create(fighter_id:30, name: "ピット", fighter_image: File.open("./app/assets/images/30.jpeg"))
Fighter.create(fighter_id:31, name: "ブラックピット", fighter_image: File.open("./app/assets/images/31.jpeg"))
Fighter.create(fighter_id:32, name: "ゼロスーツサムス", fighter_image: File.open("./app/assets/images/32.jpeg"))
Fighter.create(fighter_id:33, name: "ワリオ", fighter_image: File.open("./app/assets/images/33.jpeg"))
Fighter.create(fighter_id:34, name: "スネーク", fighter_image: File.open("./app/assets/images/34.jpeg"))
Fighter.create(fighter_id:35, name: "アイク", fighter_image: File.open("./app/assets/images/35.jpeg"))
Fighter.create(fighter_id:36, name: "ゼニガメ", fighter_image: File.open("./app/assets/images/36.jpeg"))
Fighter.create(fighter_id:37, name: "フシギソウ", fighter_image: File.open("./app/assets/images/37.jpeg"))
Fighter.create(fighter_id:38, name: "リザードン", fighter_image: File.open("./app/assets/images/38.jpeg"))
Fighter.create(fighter_id:39, name: "ディディーコング", fighter_image: File.open("./app/assets/images/39.jpeg"))
Fighter.create(fighter_id:40, name: "リュカ", fighter_image: File.open("./app/assets/images/40.jpeg"))
Fighter.create(fighter_id:41, name: "ソニック", fighter_image: File.open("./app/assets/images/41.jpeg"))
Fighter.create(fighter_id:42, name: "デデデ", fighter_image: File.open("./app/assets/images/42.jpeg"))
Fighter.create(fighter_id:43, name: "ピクミン＆オリマー", fighter_image: File.open("./app/assets/images/43.jpeg"))
Fighter.create(fighter_id:44, name: "ルカリオ", fighter_image: File.open("./app/assets/images/44.jpeg"))
Fighter.create(fighter_id:45, name: "ロボット", fighter_image: File.open("./app/assets/images/45.jpeg"))
Fighter.create(fighter_id:46, name: "トゥーンリンク", fighter_image: File.open("./app/assets/images/46.jpeg"))
Fighter.create(fighter_id:47, name: "ウルフ", fighter_image: File.open("./app/assets/images/47.jpeg"))
Fighter.create(fighter_id:48, name: "むらびと", fighter_image: File.open("./app/assets/images/48.jpeg"))
Fighter.create(fighter_id:49, name: "ロックマン", fighter_image: File.open("./app/assets/images/49.jpeg"))
Fighter.create(fighter_id:50, name: "Wii Fit トレーナー", fighter_image: File.open("./app/assets/images/50.jpeg"))
Fighter.create(fighter_id:51, name: "ロゼッタ＆チコ", fighter_image: File.open("./app/assets/images/51.jpeg"))
Fighter.create(fighter_id:52, name: "リトル・マック", fighter_image: File.open("./app/assets/images/52.jpeg"))
Fighter.create(fighter_id:53, name: "ゲッコウガ", fighter_image: File.open("./app/assets/images/53.jpeg"))
Fighter.create(fighter_id:54, name: "Miiファイター（格闘タイプ）", fighter_image: File.open("./app/assets/images/54.jpeg"))
Fighter.create(fighter_id:55, name: "Miiファイター（剣術タイプ）", fighter_image: File.open("./app/assets/images/55.jpeg"))
Fighter.create(fighter_id:56, name: "Miiファイター（射撃タイプ）", fighter_image: File.open("./app/assets/images/56.jpeg"))
Fighter.create(fighter_id:57, name: "パルテナ", fighter_image: File.open("./app/assets/images/57.jpeg"))
Fighter.create(fighter_id:58, name: "パックマン", fighter_image: File.open("./app/assets/images/58.jpeg"))
Fighter.create(fighter_id:59, name: "ルフレ", fighter_image: File.open("./app/assets/images/59.jpeg"))
Fighter.create(fighter_id:60, name: "シュルク", fighter_image: File.open("./app/assets/images/60.jpeg"))
Fighter.create(fighter_id:61, name: "クッパJr.", fighter_image: File.open("./app/assets/images/61.jpeg"))
Fighter.create(fighter_id:62, name: "ダックハント", fighter_image: File.open("./app/assets/images/62.jpeg"))
Fighter.create(fighter_id:63, name: "リュウ", fighter_image: File.open("./app/assets/images/63.jpeg"))
Fighter.create(fighter_id:64, name: "ケン", fighter_image: File.open("./app/assets/images/64.jpeg"))
Fighter.create(fighter_id:65, name: "クラウド", fighter_image: File.open("./app/assets/images/65.jpeg"))
Fighter.create(fighter_id:66, name: "カムイ", fighter_image: File.open("./app/assets/images/66.jpeg"))
Fighter.create(fighter_id:67, name: "ベヨネッタ", fighter_image: File.open("./app/assets/images/67.jpeg"))
Fighter.create(fighter_id:68, name: "インクリング", fighter_image: File.open("./app/assets/images/68.jpeg"))
Fighter.create(fighter_id:69, name: "リドリー", fighter_image: File.open("./app/assets/images/69.jpeg"))
Fighter.create(fighter_id:70, name: "シモン.リヒター", fighter_image: File.open("./app/assets/images/70.jpeg"))
Fighter.create(fighter_id:71, name: "キングクルール", fighter_image: File.open("./app/assets/images/71.jpeg"))
Fighter.create(fighter_id:72, name: "しずえ", fighter_image: File.open("./app/assets/images/72.jpeg"))
Fighter.create(fighter_id:73, name: "ガオガエン", fighter_image: File.open("./app/assets/images/73.jpeg"))
Fighter.create(fighter_id:74, name: "パックンフラワー", fighter_image: File.open("./app/assets/images/74.jpeg"))
Fighter.create(fighter_id:75, name: "ジョーカー", fighter_image: File.open("./app/assets/images/75.jpeg"))
Fighter.create(fighter_id:76, name: "勇者", fighter_image: File.open("./app/assets/images/76.jpeg"))
Fighter.create(fighter_id:77, name: "バンジョー＆カズーイ", fighter_image: File.open("./app/assets/images/77.jpeg"))
Fighter.create(fighter_id:78, name: "テリー", fighter_image: File.open("./app/assets/images/78.jpeg"))
Fighter.create(fighter_id:79, name: "ベレト.ベレス", fighter_image: File.open("./app/assets/images/79.jpeg"))
Fighter.create(fighter_id:80, name: "ミェンミェン", fighter_image: File.open("./app/assets/images/80.jpeg"))
Fighter.create(fighter_id:81, name: "スティーブ.アレックス", fighter_image: File.open("./app/assets/images/81.jpeg"))
Fighter.create(fighter_id:82, name: "セフィロス", fighter_image: File.open("./app/assets/images/82.jpeg"))
Fighter.create(fighter_id:83, name: "ホムラ", fighter_image: File.open("./app/assets/images/83.jpeg"))
Fighter.create(fighter_id:84, name: "ヒカリ", fighter_image: File.open("./app/assets/images/84.jpeg"))
Fighter.create(fighter_id:85, name: "カズヤ", fighter_image: File.open("./app/assets/images/85.jpeg"))

Admin.create(name: 'testtest', email: 'test@test.com', password: 'testtest' )

Genre.create(name: '撃墜用')
Genre.create(name: 'ダメージ用')

Startposition.create(name: '地上')
Startposition.create(name: '空中')

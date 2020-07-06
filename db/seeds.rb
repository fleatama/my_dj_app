# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ title: 'Star Wars' }, { title: 'Lord of the Rings' }])
#   Character.create(title: 'Luke', movie: movies.first)

Movie.create([
  { title: 'サカナクション / 新宝島　-New Album「834.194」(6/19 release)-', youtube_url: 'LIlZCmETvsY' },
  { title: '水樹奈々「DISCOTHEQUE」MUSIC CLIP', youtube_url: 'Fe566fX9SWw' },
  { title: '田所あずさ / 6thSingle - DEAREST DROP - 終末なにしてますか？ 忙しいですか？ 救ってもらっていいですか？ OP - Music Video Full Size', youtube_url: '94W5nENM0iM' },
  { title: '[期間限定 Full] 内田真礼「youthful beautiful」Music Video ≪Uchida Maaya≫', youtube_url: 'z6-MIsN8gwE' },
  { title: '[期間限定 Full] 内田真礼「ギミー！レボリューション」Music Video ≪Uchida Maaya -Gimme! Revolution-≫
  ', youtube_url: 'eSH-oDFJQho'},
  { title: 'サカナクション / 忘れられないの', youtube_url: 'BxqYUbNR-c0' },
  { title: 'サカナクション - ミュージック（MUSIC VIDEO） -BEST ALBUM「魚図鑑」(3/28release)-
', youtube_url: 'iVstp5Ozw2o' },
  { title: 'サカナクション - 夜の踊り子（MUSIC VIDEO） -BEST ALBUM「魚図鑑」(3/28release)-
', youtube_url: '6AozElbRnTM' },
  { title: 'サカナクション - 『バッハの旋律を夜に聴いたせいです。』（MUSIC VIDEO） -BEST ALBUM「魚図鑑」(3/28release)-
', youtube_url: 'tZbXHt3xPr8' },
  { title: 'サカナクション - エンドレス（MUSIC VIDEO） -BEST ALBUM「魚図鑑」(3/28release)-
', youtube_url: 'HZZk2Mq_yjA' }
])

Playlist.create([
  { playlist_name: 'ASMR' },
  { playlist_name: 'ポルノグラフィティ' },
  { playlist_name: 'Mr.Chirldren' },
  { playlist_name: 'サカナクション' },
  { playlist_name: 'スピッツ' },
  { playlist_name: 'DAOKO' },
  { playlist_name: 'HYDE' },
  { playlist_name: 'VAMPS' },
  { playlist_name: '内田真礼' },
  { playlist_name: '水樹奈々' },
  { playlist_name: 'Music' },
  { playlist_name: 'L’Arc～en～Ciel' },
  { playlist_name: '瞑想' },
  { playlist_name: 'Programming' }
])
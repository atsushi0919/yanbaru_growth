// コンテキスト変数を宣言
let context

// 時, 分, 秒 の変数を宣言
let h, m, s

// idで要素を取得する関数
// function gobj(id) {
//   return document.getElementById(id);
// }

// 初期設定の関数
function init() {
  // gobj 関数使用
  // context = gobj('clock').getContext('2d');

  context = document.getElementById('clock').getContext('2d')

  // タイマー処理: 1000ms毎に tick 関数を繰り返す
  setInterval(tick, 1000)
}

function tick() {
  // 現在時刻を取得
  var now = new Date()

  // 現在時刻 now から 12時間表記の時刻の時間を取得
  h = now.getHours() % 12
  // 現在時刻 now から分を取得
  m = now.getMinutes()
  // 現在時刻 now から秒を取得
  s = now.getSeconds()

  // gobj 関数使用
  // gobj('time').textContent = now.toTimeString();

  // id="time" の要素に現在時刻を文字列で表示する
  document.getElementById('time').textContent = now.toTimeString()

  // paint 関数を実行
  paint()
}

function drawHand(rotation, length, width, color) {
  // 現在の描画スタイルを保存する
  context.save()
  // 太さを設定
  context.lineWidth = width
  // 色を設定
  context.strokeStyle = color
  // (x:150,y:150)に移動（中心）
  context.translate(150, 150)
  // 指定角度に回転
  context.rotate(rotation)
  // 現在のパスをリセット
  context.beginPath()
  // 新しいサブパスの開始点を指定(x:0,y:0)
  // 座標移動後なので中心
  context.moveTo(0, 0)
  // 中心から 長さlengthの線を引く
  context.lineTo(0, -length)
  // 現在の線スタイル(太さと色)で輪郭表示
  context.stroke()
  // 保存した描画スタイルに戻す
  context.restore()
}

function paint() {
  // 左上(x:0,y:0)、右下(x:300,y:300)の正方形範囲をクリアする
  // 原点は(x:0,y:0) 右: +x , 下: +y
  context.clearRect(0, 0, 300, 300)
  // 現在の描画スタイルを保存する
  context.save()

  // x+150, y+150 に移動する（中心）
  context.translate(150, 150)
  // 描画色を黒にする
  context.strokeStyle = 'black'
  // 1分=6° を 弧度法に変換
  var pitch = (Math.PI * 2) / 60

  // 0分から59分までを繰り返す
  for (var i = 0; i < 60; i++) {
    // if (i === 6) {
    //   debugger
    // }

    // 現在のパスをリセット
    context.beginPath()
    // i 分が 5で割り切れるときは 太さ3,
    // 割り切れないときは 太さ1 を設定
    context.lineWidth = i % 5 == 0 ? 3 : 1
    // 新しいサブパスの開始点を指定(x:0,y:-120)
    context.moveTo(0, -120)
    // 直前の開始点(x:0,y:-120)から(x:0,y-140)まで線を引く
    context.lineTo(0, -140)
    // 現在の線スタイル(太さと色)で輪郭表示
    context.stroke()
    // 座標系を時計回りに pitch分 回転させる
    context.rotate(pitch)
  }
  // 保存した描画スタイルに戻す
  context.restore()

  // 現在時刻 h,m,s の時計上の角度を求める
  let radH = ((Math.PI * 2) / 12) * h + ((Math.PI * 2) / 12) * (m / 60)
  let radM = ((Math.PI * 2) / 60) * m
  let radS = ((Math.PI * 2) / 60) * s

  // 時針, 分針, 秒針 を描画する
  // drawHenad(角度, 長さ, 太さ, 色)
  drawHand(radH, 80, 6, 'blue')
  drawHand(radM, 120, 4, 'blue')
  drawHand(radS, 140, 2, 'red')
}

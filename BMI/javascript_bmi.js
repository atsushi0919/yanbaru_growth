// 標準入力からデータを全て受け取る
let lines = require('fs').readFileSync('/dev/stdin', 'utf8').split('\n')
// 1行目は身長(cm)
let height = parseFloat(lines[0])
// 2行目は体重(kg)
let weight = parseFloat(lines[1])

// 身長を cm から m に変換する
height *= 0.01
// BMI を計算する
bmi = weight / height ** 2
// BMI の少数第2位を四捨五入する
let tmp = Math.floor(bmi * 10 + 0.5)
bmi = tmp / 10

// BMI で肥満度を判定する
let result
if (bmi < 18.5) {
  result = 'thin'
} else if (bmi < 25) {
  result = 'normal'
} else {
  result = 'fat'
}

// BMI と 判定結果を出力する
console.log(bmi)
console.log(result)

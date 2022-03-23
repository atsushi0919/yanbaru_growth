<?php
// Body Mass Index
// weight[kg] / height[m] ^ 2

// --------------------
// データ受け取り
// --------------------

// 身長(cm)
$height = (float)fgets(STDIN);
// 体重(kg)
$weight = (float)fgets(STDIN);

// --------------------
// BMI 計算、肥満度判定
// --------------------

// BMI の小数点第1位までを四捨五入で求める
$bmi = $weight / pow($height * 0.01, 2);
$bmi = floor($bmi * 10 + 0.5) / 10;

// BMI で肥満度を判定する
if ($bmi < 18.5) {
  $result = "やせている";
} elseif ($bmi < 25) {
  $result = "標準";
} else {
  $result = "太っている";
}

// --------------------
// 結果の出力
// --------------------

// BMI と 判定結果を出力する
echo "BMI: ${bmi}" . PHP_EOL;
echo "肥満度: ${result}" . PHP_EOL;

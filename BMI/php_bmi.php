<?php
// Body Mass Index
// weight[kg] / height[m] ^ 2

// サンプル
// 158 41  -> 16.4  yabe
// 166 75  -> 27.2  tanaka
// 170 70  -> 24.2  atsushi
// 176 143 -> 46.2  ura
// 178 60  -> 18.9  ega

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
// 身長は cm から m に変換する
$bmi = $weight / pow($height * 0.01, 2);
$bmi = floor($bmi * 10 + 0.5) / 10;
// BMI で肥満度を判定する
if ($bmi < 18.5) {
  $result = "thin";
} elseif ($bmi < 25) {
  $result = "normal";
} else {
  $result = "fat";
}

// --------------------
// 結果の出力
// --------------------

// BMI と 判定結果を出力する
echo $bmi . PHP_EOL;
echo $result . PHP_EOL;

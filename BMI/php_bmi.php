<?php

// 身長(cm)
$height = (float)fgets(STDIN);
// 体重(kg)
$weight = (float)fgets(STDIN);

// 身長を cm から m に変換する
$height *= 0.01;
// BMI を計算する
$bmi = $weight / pow($height, 2);
// BMI の少数第2位を四捨五入する
$tmp = floor($bmi * 10 + 0.5);
$bmi = $tmp / 10;

// BMI で肥満度を判定する
if ($bmi < 18.5) {
  $result = "thin";
} elseif ($bmi < 25) {
  $result = "normal";
} else {
  $result = "fat";
}

// BMI と 判定結果を出力する
echo $bmi . PHP_EOL;
echo $result . PHP_EOL;

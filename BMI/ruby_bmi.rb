# 身長(cm)
height = gets.to_f
# 体重(kg)
weight = gets.to_f

# 身長を cm から m に変換する
height *= 0.01
# BMI を計算する
bmi = weight / height ** 2
# BMI の少数第2位を四捨五入する
tmp = (bmi * 10 + 0.5).floor
bmi = tmp / 10.0

# BMI で肥満度を判定する
result = if bmi < 18.5
    "thin"
  elsif bmi < 25
    "normal"
  else
    "fat"
  end

# BMI と 判定結果を出力する
puts bmi
puts result

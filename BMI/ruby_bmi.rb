# Body Mass Index
# weight[kg] / height[m] ^ 2

# --------------------
# データ受け取り
# --------------------

# 身長(cm)
height = gets.to_f
# 体重(kg)
weight = gets.to_f

# --------------------
# BMI 計算、肥満度判定
# --------------------

# BMI の小数点第1位までを四捨五入で求める
bmi = weight / (height * 0.01) ** 2
bmi = (bmi * 10 + 0.5).to_i / 10.0
# BMI で肥満度を判定する
result = if bmi < 18.5
    "やせている"
  elsif bmi < 25
    "標準"
  elsif bmi < 30
    "太っている"
  end

# --------------------
# BMI 計算、肥満度判定
# --------------------

# BMI と 判定結果を出力する
puts "BMI: #{bmi}"
puts "肥満度: #{result}"

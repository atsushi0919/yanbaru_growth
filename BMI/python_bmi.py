# Body Mass Index
# weight[kg] / height[m] ^ 2

# --------------------
# データ受け取り
# --------------------

# 身長(cm)
height = float(input())
# 体重(kg)
weight = float(input())

# --------------------
# BMI 計算、肥満度判定
# --------------------

# BMI の小数点第1位までを四捨五入で求める
bmi = weight / (height * 0.01) ** 2
bmi = int(bmi * 10 + 0.5) / 10
# BMI で肥満度を判定する
if bmi < 18.5:
    result = "やせている"
elif bmi < 25:
    result = "標準"
else:
    result = "太っている"

# --------------------
# BMI 計算、肥満度判定
# --------------------

# BMI と 判定結果を出力する
print(f"BMI: {bmi}")
print(f"肥満度: {result}")

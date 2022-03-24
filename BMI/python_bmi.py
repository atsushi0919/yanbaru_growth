# Body Mass Index
# weight[kg] / height[m] ^ 2

# サンプル
# 158 41  -> 16.4   yabe
# 166 75  -> 27.2   tanaka
# 170 70  -> 24.2   atsushi
# 176 143 -> 46.2   ura
# 178 60  -> 18.9   ega

# --------------------
# データ受け取り
# --------------------

# 身長(cm)
height = int(input())
# 体重(kg)
weight = int(input())

# --------------------
# BMI 計算、肥満度判定
# --------------------

# 身長は cm から m に変換する
height *= 0.01
# BMI を計算する
bmi = weight / height ** 2
# BMI の少数第2位を四捨五入する
tmp = int(bmi * 10 + 0.5)
bmi = tmp / 10.0
# BMI で肥満度を判定する
if bmi < 18.5:
    result = "thin"
elif bmi < 25:
    result = "normal"
else:
    result = "fat"

# --------------------
# BMI 計算、肥満度判定
# --------------------

# BMI と 判定結果を出力する
print(bmi)
print(result)

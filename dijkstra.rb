# ダイクストラ法(Dijkstra's Algorithm)

require "./priority_queue"

# ---------------------------------------
# 1. グラフの隣接リストadjacency_listを定義
# ---------------------------------------
ADJACENCY_LIST = [
  [[1, 4], [2, 7], [5, 9]],
  [[0, 4], [2, 2], [3, 6]],
  [[0, 7], [1, 2], [3, 3], [5, 5]],
  [[1, 6], [2, 3], [4, 5]],
  [[3, 5], [5, 7]],
  [[0, 9], [4, 7]],
]
# NODE: ノード数, START: 開始ノード番号
NODE = 6
START = 0

# ---------------------------------------
# 2. 最小コスト min_costs を nil で初期化
# ---------------------------------------
min_costs = Array.new(NODE)

# ---------------------------------------
# 3. 探索リストserch_listに
# [初期コスト, 開始ノード番号]を追加
# ---------------------------------------
search_list = PriorityQueue.new
search_list.insert([0, 0])

# ---------------------------------------
# 4. search_listに要素がある間繰り返す
# ---------------------------------------
while search_list.size > 0

  # ---------------------------------------
  # 4.1. 最小コストの要素[cost, node]を取り出す
  # ---------------------------------------
  cost, node = search_list.extract

  # ---------------------------------------
  # 4.2. min_costs[node]が確定済みならスキップ
  # ---------------------------------------
  next if not min_costs[node].nil?

  # ---------------------------------------
  # 4.3. 取り出したノードの最小コストを確定
  # ---------------------------------------
  min_costs[node] = cost

  # ---------------------------------------
  # 4.4. 全ノードの最小コストが確定したら終了
  # ---------------------------------------
  break if not min_costs.any?(nil)

  # ---------------------------------------
  # 4.5. 隣接ノードを順番に参照する
  # ---------------------------------------
  ADJACENCY_LIST[node].each do |next_node, next_cost|
    # ---------------------------------------
    # 4.5.1. 隣接ノードの最小コストが確定済みならスキップ
    # ---------------------------------------
    next if not min_costs[next_node].nil?

    # ---------------------------------------
    # 4.5.2. search_listに隣接ノードまでの
    # コストとノード番号[cost + next_cost, next_node]を追加
    # ---------------------------------------
    search_list.insert([cost + next_cost, next_node])
  end
end

# ---------------------------------------
# 5. min_costsを参照する
# ---------------------------------------
min_costs.each_with_index do |cost, idx|
  puts "#{START} から #{idx} までの最小コストは #{cost.to_s.rjust(2)} です"
end

# 実行結果
# > 0 から 0 までの最小コストは  0 です
# > 0 から 1 までの最小コストは  4 です
# > 0 から 2 までの最小コストは  6 です
# > 0 から 3 までの最小コストは  9 です
# > 0 から 4 までの最小コストは 14 です
# > 0 から 5 までの最小コストは  9 です

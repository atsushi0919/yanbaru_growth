# ダイクストラ法(Dijkstra's Algorithm)

# 隣接リスト
ADJACENCY_LIST = [
  [[1, 4], [2, 7], [5, 9]],
  [[0, 4], [2, 2], [3, 6]],
  [[0, 7], [1, 2], [3, 3], [5, 5]],
  [[1, 6], [2, 3], [4, 5]],
  [[3, 5], [5, 7]],
  [[0, 9], [4, 7]],
]

NODE = 6
START = 0

require "byebug"

byebug

# 各ノードまでの最小コストを nil で初期化
min_costs = Array.new(NODE)

# スタート地点の情報[0: 運賃, 0: 駅番号]で routes を初期化
search_list = [[0, 0]]

# search_list が空になるまで繰り返す
while not search_list.empty?
  # 最小コストの要素(ノード)を取り出す
  search_list.sort!
  # cost: 取り出したノードの最小コスト
  # node: 取り出したノードの番号
  cost, node = search_list.shift

  # 取り出したノードの最小コストが確定済みならスキップ
  next if not min_costs[node].nil?

  # 取り出したノードの最小コストを確定させる
  min_costs[node] = cost

  # 全ノードの最小コストが確定したらループを終了する
  break if not min_costs.any?(nil)

  # 隣接ノードを順番に参照する
  ADJACENCY_LIST[node].each do |next_node, next_cost|
    # 隣接ノードの最小コストが確定済みならスキップ
    next if not min_costs[next_node].nil?
    # search_list に隣接ノードまでのcostとノード番号を追加
    search_list << [cost + next_cost, next_node]
  end
end

min_costs.each_with_index do |cost, idx|
  puts "#{START} から #{idx} までの最小コストは #{cost.to_s.rjust(2)} です"
end

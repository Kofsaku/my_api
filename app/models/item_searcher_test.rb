params = ActionController::Parameters.new(author: "津端", keyword: "英語", tag_names: "")
item_searcher1 = ItemSearcher.new(params, Item.all)
item_searcher2 = ItemSearcher.new(params, Item.all,"モテテクニック")
item_searcher3 = ItemSearcher.new(params, Item.all, "織田", "", ["歴史","英語"])
item_searcher4 = ItemSearcher.new(params, Item.all, ["歴史", "ミステリー"])
item_searcher5 = ItemSearcher.new(params, Item.all, "", "プログラム", "")
item_searcher6 = ItemSearcher.new(params, Item.all, "", "信長", "歴史")
item_searcher7 = ItemSearcher.new(params, Item.all, "津端", "英語", "")

if item_searcher1.execute.count != 3
     raise "アウト"
end
if item_searcher2.execute.count != 3
     raise "アウト"
end
if item_searcher3.execute.count != 1
     raise "アウト"
end
if item_searcher4.execute.count != 3
     raise "アウト"
end
if item_searcher5.execute.count != 1 
     raise "アウト"
end
if item_searcher6.execute.count != 2
     raise "アウト"
end
if item_searcher7.execute.count != 2
     raise "アウト"
end




params = ActionController::Parameters.new(author: "", keyword: "", tag_names: ["英語","歴史"])
item_searcher = ItemSearcher.new(params, Item.all)
if item_searcher.execute.count != 1
     raise "アウト"
end

params = ActionController::Parameters.new(author: "", keyword: "プログラム", tag_names: "")
item_searcher = ItemSearcher.new(params, Item.all)
if item_searcher.execute.count != 1
     raise "アウト"
end

params = ActionController::Parameters.new(author: "津端", keyword: "", tag_names: "")
item_searcher = ItemSearcher.new(params, Item.all)
if item_searcher.execute.count != 3
     raise "アウト"
end

params = ActionController::Parameters.new(author: "", keyword: "", tag_names: "")
item_searcher = ItemSearcher.new(params, Item.all)
if item_searcher.execute.count != 44
     raise "アウト"
end

params = ActionController::Parameters.new(author: "織田", keyword: "幼少期", tag_names: "ミステリー")
item_searcher = ItemSearcher.new(params, Item.all)
if item_searcher.execute.count != 1
     raise "アウト"
end

params = ActionController::Parameters.new(author: "津端", keyword: "モテモテ", tag_names: ["モテテクニック", "英語"])
item_searcher = ItemSearcher.new(params, Item.all)
if item_searcher.execute.count != 1
     raise "アウト"
end

params = ActionController::Parameters.new(author: "", keyword: "戦国大名", tag_names: ["ミステリー","歴史"])
item_searcher = ItemSearcher.new(params, Item.all)
if item_searcher.execute.count != 1
     raise "アウト"
end

params = ActionController::Parameters.new(author: "織田", keyword: "", tag_names: "ミステリー")
item_searcher = ItemSearcher.new(params, Item.all)
if item_searcher.execute.count != 2
     raise "アウト"
end

params = ActionController::Parameters.new(author: "織田", keyword: "本質", tag_names: "")
item_searcher = ItemSearcher.new(params, Item.all)
if item_searcher.execute.count != 1
     raise "アウト"
end

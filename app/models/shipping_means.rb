class Shipping_means < ActiveHash::Base
  self.data = [
      {id: 1, means: '未定'}, {id: 2, means: 'らくらくメルカリ便'}, {id: 3, means: 'ゆうメール'},
      {id: 4, means: 'レターパック'}, {id: 5, means: '普通郵便（定形・定形外）'}, {id: 6, means: 'ゆうメール'},
      {id: 7, means: 'ゆうパック'}, {id: 8, means: 'クリックポスト'}, {id: 9, means: 'ゆうパケット'},
  ]
end


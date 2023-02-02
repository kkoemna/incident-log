class Place < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '301号室' },
    { id: 2, name: '302号室' },
    { id: 3, name: '401号室' },
    { id: 4, name: '402号室' },
    { id: 5, name: '501号室' },
    { id: 6, name: '502号室' },
    { id: 7, name: '601号室' },
    { id: 8, name: '602号室' },
    { id: 9, name: '3階廊下' },
    { id: 10, name: '4階廊下' },
    { id: 11, name: '5階廊下' },
    { id: 12, name: '6階廊下' },
    { id: 13, name: '駐車場' },
    { id: 14, name: 'エントランス' },
    { id: 15, name: 'ラウンジ' },
    { id: 16, name: 'フロント' },
    { id: 17, name: '従業員控室' },
    { id: 18, name: 'リネン室' },
    { id: 19, name: 'ランドリー室' },
    { id: 20, name: 'ボイラー室' },
    { id: 21, name: '屋上' },
    { id: 22, name: 'エレベーター' },
    { id: 23, name: '非常階段' },
    { id: 24, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :incidents
end
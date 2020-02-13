# README
# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|password|string|null: false|
|email|string|null: false, unique: true|

### Association
- has_many :items
- has_many :likes dependent: :destroy
- has_many :comments dependent: :destroy
- has many :messages dependent: :destroy
- has many :points dependent: :destroy
- has_many :deliver_addresses dependent: :destroy
- has_many :reviews dependent: :destroy
- has_many :orders dependent: :destroy


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|saler_user_id|references|null: false, foreign_key: true|
|buyer_user_id|references|foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|condition|integer|null: false|
|postage|string|null: false|
|region|string|null: false|
|shipping_date|string|null: false|
|text|text|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :likes dependent: :destroy
- has_many :comments dependent: :destroy
- has_many :messages dependent: :destroy
- has_many :reviews
- has_many :item_images dependent: :destroy
- has_many :order


## deliver_adressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|zip_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address1|string|null: false|
|address2|string||
|telephone|string|unique: true|

### Association
- belongs_to :user


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :item


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :item


# reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|date|integer|null: false|
|text|text||

### Association
- belongs_to :user
- belongs_to :item


## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image_url|string|null: false|

### Association
- belongs_to :item


## brand_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :brands


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :brands
- has_many :items
- has_ancestry


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, foreign_key: true|
|brand_group_id|references|null: false, foreign_key: true|
|name|string|null: false|

### Association
- has_many :item
- belongs_to :brand_group
- belongs_to :category


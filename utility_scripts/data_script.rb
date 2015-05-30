Collection.all.destroy_all
Tag.destroy_all
Item.destroy_all
User.destroy_all
UserChoice.destroy_all
UserFriend.destroy_all

puts "Tables Deleted"

#Create Users
U1 = User.create(:phone => '1111111111', :password => '123456', :name => 'Tyrion', :session_token => 'abcdefgh1', :twitter_handle => 'https://twitter.com/Tyrion')
U1.photo = File.new("#{Rails.root}/images/GOT/Tyrion.jpg")
U1.save

U2 = User.create(:phone => '2222222222', :password => '123456', :name => 'Jon', :session_token => 'abcdefgh2', :twitter_handle => 'https://twitter.com/Jon')
U2.photo = File.new("#{Rails.root}/images/GOT/snow.jpg")
U2.save

U3 = User.create(:phone => '3333333333', :password => '123456', :name => 'Sansa', :session_token => 'abcdefgh3', :twitter_handle => 'https://twitter.com/Sansa')
U3.photo = File.new("#{Rails.root}/images/GOT/sansa.jpg")
U3.save

U4 = User.create(:phone => '4444444444', :password => '123456', :name => 'Bran', :session_token => 'abcdefgh4', :twitter_handle => 'https://twitter.com/Bran')
U4.photo = File.new("#{Rails.root}/images/GOT/bran.jpg")
U4.save

U5 = User.create(:phone => '5555555555', :password => '123456', :name => 'Arya', :session_token => 'abcdefgh5', :twitter_handle => 'https://twitter.com/Arya')
U5.photo = File.new("#{Rails.root}/images/GOT/arya.png")
U5.save

U6 = User.create(:phone => '6666666666', :password => '123456', :name => 'Cersei', :session_token => 'abcdefgh6', :twitter_handle => 'https://twitter.com/Cersei')
U6.photo = File.new("#{Rails.root}/images/GOT/cersei.jpg")
U6.save

U7 = User.create(:phone => '7777777777', :password => '123456', :name => 'Daenerys', :session_token => 'abcdefgh7', :twitter_handle => 'https://twitter.com/Daenerys')
U7.photo = File.new("#{Rails.root}/images/GOT/daenerys.jpg")
U7.save

U8 = User.create(:phone => '8888888888', :password => '123456', :name => 'Hodor', :session_token => 'abcdefgh8', :twitter_handle => 'https://twitter.com/Hodor')
U8.photo = File.new("#{Rails.root}/images/GOT/hodor.jpg")
U8.save

U9 = User.create(:phone => '9999999999', :password => '123456', :name => 'Jaime', :session_token => 'abcdefgh9', :twitter_handle => 'https://twitter.com/Jaime')
U9.photo = File.new("#{Rails.root}/images/GOT/jaime.jpg")
U9.save

puts "Users Created"

#Create Collection
C1 = Collection.create(:name => 'North Indian Dishes')
C2 = Collection.create(:name => 'South Indian Dishes')
C3 = Collection.create(:name => 'Continental Dishes')
C4 = Collection.create(:name => 'Thai Dishes')
C5 = Collection.create(:name => 'Chinese Dishes')
C6 = Collection.create(:name => 'Italian Dishes')
C7 = Collection.create(:name => 'Gujrati Dishes')
C8 = Collection.create(:name => 'Restaurants')
C9 = Collection.create(:name => 'Coffee Cafe')
C10 = Collection.create(:name => 'Ice Creams')

puts "Collections Created"

#Create Tags
T1 = Tag.create(:name => 'Veg')
T2 = Tag.create(:name => 'Non-Veg')
T3 = Tag.create(:name => 'North Indian')
T4 = Tag.create(:name => 'South Indian')
T5 = Tag.create(:name => 'Continental')
T6 = Tag.create(:name => 'Italian')
T7 = Tag.create(:name => 'Chinese')
T8 = Tag.create(:name => 'Spicy')
T9 = Tag.create(:name => 'Sweet')
T10 = Tag.create(:name => 'Strong')
T11 = Tag.create(:name => 'Mild')
T12 = Tag.create(:name => 'Alcoholic')
T13 = Tag.create(:name => 'Night Life')
T14 = Tag.create(:name => 'Brewery')
T15 = Tag.create(:name => 'RoofTop')
T16 = Tag.create(:name => 'Clubs')
T17 = Tag.create(:name => 'DineIn')
T18 = Tag.create(:name => 'Expensive')
T19 = Tag.create(:name => 'Cheap')
T20 = Tag.create(:name => 'Economical')
T21 = Tag.create(:name => 'Low-Calorie')
T22 = Tag.create(:name => 'High-Calorie')
T23 = Tag.create(:name => 'Healthy')

puts "Tags Created"

#Create Items
I1 = Item.create(:name => 'Almond Jelly', :collection_id => C5.id)
I1.logo = File.new("#{Rails.root}/images/chinese/almond_jelly.jpg")
I1.save
I1.tags.push(Tag.find(T7.id, T1.id, T9.id, T22.id))

I2 = Item.create(:name => 'Noodles', :collection_id => C5.id)
I2.logo = File.new("#{Rails.root}/images/chinese/chinese_noodles.jpg")
I2.save
I2.tags.push(Tag.find(T7.id, T8.id, T22.id))

I3 = Item.create(:name => 'Jasmine Tea', :collection_id => C5.id)
I3.logo = File.new("#{Rails.root}/images/chinese/jasmine_tea.jpg")
I3.save
I3.tags.push(Tag.find(T1.id, T7.id, T21.id, T23.id))

I4 = Item.create(:name => 'Momos', :collection_id => C5.id)
I4.logo = File.new("#{Rails.root}/images/chinese/Jiaozi.jpg")
I4.save
I4.tags.push(Tag.find(T1.id, T7.id, T22.id, T11.id))

I5 = Item.create(:name => 'Barista', :collection_id => C9.id)
I5.logo = File.new("#{Rails.root}/images/coffee/barista.jpg")
I5.save
I5.tags.push(Tag.find(T1.id, T20.id, T10.id, T11.id))

I6 = Item.create(:name => 'CCD', :collection_id => C9.id)
I6.logo = File.new("#{Rails.root}/images/coffee/ccd.jpg")
I6.save
I6.tags.push(Tag.find(T1.id, T19.id, T11.id, T11.id))

I7 = Item.create(:name => 'COSTA', :collection_id => C9.id)
I7.logo = File.new("#{Rails.root}/images/coffee/costa.jpg")
I7.save
I7.tags.push(Tag.find(T1.id, T19.id, T10.id, T11.id))

I8 = Item.create(:name => 'STARBUCKS', :collection_id => C9.id)
I8.logo = File.new("#{Rails.root}/images/coffee/starbucks.jpg")
I8.save
I8.tags.push(Tag.find(T1.id, T19.id, T18.id, T11.id))

I9 = Item.create(:name => 'Corn Nuggets', :collection_id => C3.id)
I9.logo = File.new("#{Rails.root}/images/continental/corn_nuggets_c3.jpg")
I9.save
I9.tags.push(Tag.find(T1.id, T5.id, T11.id, T20.id, T22.id))

I10 = Item.create(:name => 'Fish', :collection_id => C3.id)
I10.logo = File.new("#{Rails.root}/images/continental/fish_c3.jpg")
I10.save
I10.tags.push(Tag.find(T2.id, T5.id, T11.id, T20.id, T8.id))

I11 = Item.create(:name => 'Salad', :collection_id => C3.id)
I11.logo = File.new("#{Rails.root}/images/continental/salad_c3.jpg")
I11.save
I11.tags.push(Tag.find(T1.id, T5.id, T11.id, T20.id, T23.id))

I12 = Item.create(:name => 'Sizzler', :collection_id => C3.id)
I12.logo = File.new("#{Rails.root}/images/continental/sizzler_c3.jpg")
I12.save
I12.tags.push(Tag.find(T1.id, T5.id, T11.id, T8.id, T18.id, T22.id))

I13 = Item.create(:name => 'Aam Shakarkand', :collection_id => C7.id)
I13.logo = File.new("#{Rails.root}/images/gujrati/aam_shakarkand.jpg")
I13.save
I13.tags.push(Tag.find(T1.id, T9.id, T20.id, T22.id))

I14 = Item.create(:name => 'Dhokla', :collection_id => C7.id)
I14.logo = File.new("#{Rails.root}/images/gujrati/dhokla.jpg")
I14.save
I14.tags.push(Tag.find(T2.id, T1.id, T11.id, T20.id, T22.id))

I15 = Item.create(:name => 'Kakhra', :collection_id => C7.id)
I15.logo = File.new("#{Rails.root}/images/gujrati/kakhra.jpg")
I15.save
I15.tags.push(Tag.find(T2.id, T1.id, T8.id, T20.id, T22.id, T11.id))

I16 = Item.create(:name => 'Khandvi', :collection_id => C7.id)
I16.logo = File.new("#{Rails.root}/images/gujrati/Khandvi.jpg")
I16.save
I16.tags.push(Tag.find(T2.id, T1.id, T11.id, T20.id, T22.id))

I17 = Item.create(:name => 'Uundhyu', :collection_id => C7.id)
I17.logo = File.new("#{Rails.root}/images/gujrati/Uundhyu.jpg")
I17.save
I17.tags.push(Tag.find(T2.id, T1.id, T11.id, T20.id, T22.id))

I18 = Item.create(:name => 'Butter Chicken', :collection_id => C1.id)
I18.logo = File.new("#{Rails.root}/images/north_indian/butter_chicken_c1.jpg")
I18.save
I18.tags.push(Tag.find(T2.id, T3.id, T20.id, T8.id, T10.id, T22.id))

I19 = Item.create(:name => 'Dum Aloo', :collection_id => C1.id)
I19.logo = File.new("#{Rails.root}/images/north_indian/dum_aaloo_c1.jpg")
I19.save
I19.tags.push(Tag.find(T1.id, T3.id, T20.id, T8.id, T10.id, T22.id))

I20 = Item.create(:name => 'Fruit Lassi', :collection_id => C1.id)
I20.logo = File.new("#{Rails.root}/images/north_indian/fruit_lassi_c1.jpg")
I20.save
I20.tags.push(Tag.find(T1.id, T3.id, T20.id, T9.id, T10.id, T22.id))

I21 = Item.create(:name => 'Kadhi', :collection_id => C1.id)
I21.logo = File.new("#{Rails.root}/images/north_indian/kadhi_c1.jpg")
I21.save
I21.tags.push(Tag.find(T1.id, T3.id, T20.id, T8.id, T10.id, T22.id))

I22 = Item.create(:name => 'Paratha', :collection_id => C1.id)
I22.logo = File.new("#{Rails.root}/images/north_indian/paratha_c1.jpg")
I22.save
I22.tags.push(Tag.find(T1.id, T3.id, T20.id, T8.id, T10.id, T22.id))

I23 = Item.create(:name => 'Cocunut Milk', :collection_id => C2.id)
I23.logo = File.new("#{Rails.root}/images/south_indian/cocunut_milk_c2.jpg")
I23.save
I23.tags.push(Tag.find(T2.id, T4.id, T20.id, T9.id, T10.id, T23.id))

I24 = Item.create(:name => 'Curd Rice', :collection_id => C2.id)
I24.logo = File.new("#{Rails.root}/images/south_indian/curd_rice_c2.jpg")
I24.save
I24.tags.push(Tag.find(T1.id, T4.id, T20.id, T8.id, T10.id, T22.id))

I25 = Item.create(:name => 'Dosa', :collection_id => C2.id)
I25.logo = File.new("#{Rails.root}/images/south_indian/dosa_c2.jpg")
I25.save
I25.tags.push(Tag.find(T1.id, T4.id, T19.id, T10.id, T22.id))

I26 = Item.create(:name => 'Idli', :collection_id => C2.id)
I26.logo = File.new("#{Rails.root}/images/south_indian/idli_c2.jpg")
I26.save
I26.tags.push(Tag.find(T1.id, T4.id, T20.id, T11.id, T22.id))

I27 = Item.create(:name => 'Uttapam', :collection_id => C2.id)
I27.logo = File.new("#{Rails.root}/images/south_indian/uttapam_c2.jpg")
I27.save
I27.tags.push(Tag.find(T1.id, T4.id, T20.id, T8.id, T22.id))

I28 = Item.create(:name => 'Medu Vada', :collection_id => C2.id)
I28.logo = File.new("#{Rails.root}/images/south_indian/medu_vada_c2.jpg")
I28.save
I28.tags.push(Tag.find(T1.id, T4.id, T19.id, T8.id, T22.id))

I29 = Item.create(:name => 'Breweries', :collection_id => C8.id)
I29.logo = File.new("#{Rails.root}/images/restaurants/brewery_2.jpg")
I29.save
I29.tags.push(Tag.find(T10.id, T12.id, T18.id, T22.id, T14.id))

I30 = Item.create(:name => 'Dhaba', :collection_id => C8.id)
I30.logo = File.new("#{Rails.root}/images/restaurants/dhaba.jpg")
I30.save
I30.tags.push(Tag.find(T3.id, T17.id, T19.id, T22.id))

I31 = Item.create(:name => 'Dine In', :collection_id => C8.id)
I31.logo = File.new("#{Rails.root}/images/restaurants/dining.jpg")
I31.save
I31.tags.push(Tag.find(T17.id, T18.id, T22.id))

I32 = Item.create(:name => 'Pubs', :collection_id => C8.id)
I32.logo = File.new("#{Rails.root}/images/restaurants/pub.jpg")
I32.save
I32.tags.push(Tag.find(T10.id, T12.id, T13.id, T18.id, T22.id, T14.id))

I33 = Item.create(:name => 'Roof Top Restaurants', :collection_id => C8.id)
I33.logo = File.new("#{Rails.root}/images/restaurants/rooftop.jpg")
I33.save
I33.tags.push(Tag.find(T10.id, T12.id, T13.id, T18.id, T22.id, T15.id))

I34 = Item.create(:name => 'Subway', :collection_id => C8.id)
I34.logo = File.new("#{Rails.root}/images/restaurants/Subway.jpg")
I34.save
I34.tags.push(Tag.find(T10.id, T11.id, T3.id, T20.id, T21.id, T23.id))


I35 = Item.create(:name => 'Pizza', :collection_id => C6.id)
I35.logo = File.new("#{Rails.root}/images/italian/pizza.jpg")
I35.save
I35.tags.push(Tag.find(T11.id, T6.id, T18.id, T22.id))


I36 = Item.create(:name => 'Bruschetta', :collection_id => C6.id)
I36.logo = File.new("#{Rails.root}/images/italian/Bruschetta.jpg")
I36.save
I36.tags.push(Tag.find(T11.id, T6.id, T18.id, T22.id))

puts "Items Created"

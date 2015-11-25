
Image.create!([
  {url: "https://s-media-cache-ak0.pinimg.com/236x/50/8a/29/508a29a0311ad341927b800f5072bf83.jpg", product_id: 1},
  {url: "https://s-media-cache-ak0.pinimg.com/236x/50/8a/29/508a29a0311ad341927b800f5072bf83.jpg", product_id: 2},
  {url: "http://irishcoffee.org/wp-content/themes/shopperpress/thumbs/Irish-Coffee1.jpg", product_id: 3},
  {url: "http://www.benhirshberg.com/uploads/9/9/1/5/9915898/128754515.jpg?407", product_id: 4}
])
Product.create!([
  {name: "Cuban Coffee", price: "18.0", image: "https://s-media-cache-ak0.pinimg.com/236x/50/8a/29/508a29a0311ad341927b800f5072bf83.jpg", description: "Espresso originated in Cuba", in_stock: true, supplier_id: nil, user_id: nil},
  {name: "Arabian Coffee", price: "17.0", image: "https://s-media-cache-ak0.pinimg.com/236x/d3/18/85/d318858474fe2aabac8be772c13fc393.jpg", description: "Turkish Style and Saudi Style", in_stock: true, supplier_id: nil, user_id: nil},
  {name: "Irish Coffee", price: "24.0", image: "http://irishcoffee.org/wp-content/themes/shopperpress/thumbs/Irish-Coffee1.jpg", description: "Cocktail of hot coffee and whiskey", in_stock: true, supplier_id: nil, user_id: nil},
  {name: "Bulletproof Coffee\r\n", price: "36.0", image: "http://www.benhirshberg.com/uploads/9/9/1/5/9915898/128754515.jpg?407", description: "Black blended coffee with grass-fed butter and Brain Octane Oil", in_stock: true, supplier_id: nil, user_id: nil}
])

import 'product.dart';

class MyProducts{
  static List<Product> allProducts= [
    Product(
        id: 1, 
        name: "Sony Heaphones",
        category: "electronic", 
        price: 1000, 
        description: " Sony headphones blend sophisticated styling with exceptional comfort. And with a lighter-weight design, you'll barely notice you're wearing them.", 
        image: "assests/product/headphone2.png", 
        quantity: 1),
    Product(id: 2,
        name: "Acer Laptop",
        category: "electronic",
        price: 30000,
        description: "Acer Aspire 5 is a Windows 10 laptop with a 15.60-inch display that has a resolution of 1920x1080 pixels. It is powered by a Core i5 processor and it comes with 8GB of RAM.",
        image: "assests/product/acer_laptop_4.png",
        quantity: 1),
    Product(
        id: 3,
        name: "Apple iPhone 12",
        category: "electronic",
        price: 40000,
        description: "Power packed with superpowerful chip, an advanced dual‑camera system. A Ceramic Shield front that's tougher than any smartphone glass. And a bright, beautiful OLED display.",
        image: "assests/product/iphone_12_blue.png",
        quantity: 1),
    Product(id: 4,
        name: "Nike Air Jordon",
        category: "Fashion",
        price: 10000,
        description: "With features like advanced cushioning systems, lightweight materials, and responsive soles, these shoes are designed to support athletes and casual wearers",
        image: "assests/product/NikeAirJOrdonOrange.png",
        quantity: 1),
    Product(id: 5,
        name: "Polo T-Shirt",
        category: "Fashion",
        price: 700,
        description: "Upgrade your style with our premium cotton Classic Polo T-Shirt. Featuring a ribbed collar, two-button placket, and tailored fit, it’s perfect for any occasion.",
        image: "assests/product/tshirt_red_collar.png",
        quantity: 1),
    Product(id: 6,
        name: "Sports Track Suit",
        category: "Fashion",
        price: 1500,
        description: "Stay comfortable and stylish with our Sports Tracksuit. Made from breathable, moisture-wicking fabric, it features a zip-up jacket and matching pants, perfect for workouts or casual wear",
        image: "assests/product/trcksuit_parrotgreen.png",
        quantity: 1),
  ];
  static List<Product> electronicList= [
    Product(
        id: 1,
        name: "Sony Heaphones",
        category: "electronic",
        price: 1000,
        description: " Sony headphones blend sophisticated styling with exceptional comfort. And with a lighter-weight design, you'll barely notice you're wearing them.",
        image: "assests/product/headphone2.png",
        quantity: 1),
    Product(id: 2,
        name: "Acer Laptop",
        category: "electronic",
        price: 30000,
        description: "Acer Aspire 5 is a Windows 10 laptop with a 15.60-inch display that has a resolution of 1920x1080 pixels. It is powered by a Core i5 processor and it comes with 8GB of RAM.",
        image: "assests/product/acer_laptop_4.png",
        quantity: 1),
    Product(
        id: 3,
        name: "Apple iPhone 12",
        category: "electronic",
        price: 40000,
        description: "Power packed with superpowerful chip, an advanced dual‑camera system. A Ceramic Shield front that's tougher than any smartphone glass. And a bright, beautiful OLED display.",
        image: "assests/product/iphone_12_blue.png",
        quantity: 1),
  ];
  static List<Product> FashionList =[
    Product(id: 1,
        name: "Nike Air Jordon",
        category: "Fashion",
        price: 10000,
        description: "With features like advanced cushioning systems, lightweight materials, and responsive soles, these shoes are designed to support athletes and casual wearers",
        image: "assests/product/NikeAirJOrdonOrange.png",
        quantity: 1),
    Product(id: 2,
        name: "Polo T-Shirt",
        category: "Fashion",
        price: 700,
        description: "Upgrade your style with our premium cotton Classic Polo T-Shirt. Featuring a ribbed collar, two-button placket, and tailored fit, it’s perfect for any occasion.",
        image: "assests/product/tshirt_red_collar.png",
        quantity: 1),
    Product(id: 3,
        name: "Sports Track Suit",
        category: "Fashion",
        price: 1500,
        description: "Stay comfortable and stylish with our Sports Tracksuit. Made from breathable, moisture-wicking fabric, it features a zip-up jacket and matching pants, perfect for workouts or casual wear",
        image: "assests/product/trcksuit_parrotgreen.png",
        quantity: 1),
  ];
}
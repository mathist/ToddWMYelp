//
//  Business.swift
//  ToddWMYelp
//
//  Created by Todd Mathison on 11/20/24.
//

import Foundation

struct Business: Identifiable, Codable {
    var id: String
    var name: String
    var image_url: String?
    var distance: Double?
    var url: String?
    var coordinates: Coordinates?
    var location: Location?
}

struct Coordinates: Codable {
    var latitude: Double?
    var longitude: Double?
}

struct Location: Codable {
    var display_address: [String]?
    var city: String?
    var address1: String?
    var address2: String?
    var zip_code: String?
    var state: String?
    var country: String?
}

struct BusinessData: Codable {
    var businesses: [Business]
    
    static func testData() -> Data {
        let jsonString = """
        {
          "businesses" : [
            {
              "id" : "L49sbxCP8QiObg-FoisE1w",
              "is_closed" : false,
              "review_count" : 4,
              "categories" : [
                {
                  "alias" : "breakfast_brunch",
                  "title" : "Breakfast & Brunch"
                },
                {
                  "alias" : "cafes",
                  "title" : "Cafes"
                },
                {
                  "alias" : "pizza",
                  "title" : "Pizza"
                }
              ],
              "rating" : 3.5,
              "phone" : "",
              "image_url" : "https://s3-media3.fl.yelpcdn.com/bphoto/f3sTqDdWTP6mY0sFsGrHxg/o.jpg",
              "url" : "https://www.yelp.com/biz/caffe-macs-cupertino-6?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [

              ],
              "display_phone" : "",
              "location" : {
                "display_address" : [
                  "4 Infinite Lp",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "4 Infinite Lp",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : null,
                "state" : "CA",
                "address2" : ""
              },
              "alias" : "caffe-macs-cupertino-6",
              "coordinates" : {
                "longitude" : -122.02893,
                "latitude" : 37.332509999999999
              },
              "attributes" : {
                "waitlist_reservation" : null,
                "business_temp_closed" : null,
                "menu_url" : null,
                "open24_hours" : null
              },
              "transactions" : [

              ],
              "distance" : 199.65794438634757,
              "name" : "Caffe Macs"
            },
            {
              "id" : "j4y3YcEUULyNG9JzqGZkXg",
              "is_closed" : false,
              "review_count" : 0,
              "categories" : [
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                }
              ],
              "rating" : 0,
              "phone" : "",
              "image_url" : "",
              "url" : "https://www.yelp.com/biz/le-french-quarter-coffee-cupertino?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [

              ],
              "display_phone" : "",
              "location" : {
                "display_address" : [
                  "10431 N De Anza Blvd",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "10431 N De Anza Blvd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : null,
                "state" : "CA",
                "address2" : ""
              },
              "alias" : "le-french-quarter-coffee-cupertino",
              "coordinates" : {
                "longitude" : -122.03304,
                "latitude" : 37.329259999999998
              },
              "attributes" : {
                "business_temp_closed" : null,
                "menu_url" : null,
                "waitlist_reservation" : null
              },
              "transactions" : [

              ],
              "distance" : 385.96406800407618,
              "name" : "Le French Quarter Coffee"
            },
            {
              "id" : "MxhMZWcAQoBWd6AhHDd3Gg",
              "is_closed" : false,
              "review_count" : 2,
              "categories" : [
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                }
              ],
              "rating" : 5,
              "phone" : "+16503368711",
              "image_url" : "https://s3-media2.fl.yelpcdn.com/bphoto/mJxmtWw-jR__11Xp2LBAnQ/o.jpg",
              "url" : "https://www.yelp.com/biz/caf%C3%A9-225-cupertino-3?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [

              ],
              "display_phone" : "(650) 336-8711",
              "location" : {
                "display_address" : [
                  "10355 N De Anza Blvd",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "10355 N De Anza Blvd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : ""
              },
              "alias" : "café-225-cupertino-3",
              "coordinates" : {
                "longitude" : -122.03293600000001,
                "latitude" : 37.328082999999999
              },
              "attributes" : {
                "business_temp_closed" : null,
                "menu_url" : null,
                "waitlist_reservation" : null
              },
              "transactions" : [

              ],
              "distance" : 445.48587180352104,
              "name" : "Café 225"
            },
            {
              "id" : "sFO4RrY4-WGSdM8jJC70Tw",
              "is_closed" : false,
              "review_count" : 9,
              "categories" : [
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                }
              ],
              "rating" : 3.6000000000000001,
              "phone" : "+14082530119",
              "image_url" : "https://s3-media2.fl.yelpcdn.com/bphoto/PJVFtE0avdKJbo31PrUPNA/o.jpg",
              "url" : "https://www.yelp.com/biz/starbucks-cupertino-21?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "1830",
                      "day" : 0,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1830",
                      "day" : 1,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1830",
                      "day" : 2,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1830",
                      "day" : 3,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1830",
                      "day" : 4,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1830",
                      "day" : 5,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1830",
                      "day" : 6,
                      "start" : "0600"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 253-0119",
              "location" : {
                "display_address" : [
                  "20620 Homestead Rd",
                  "Safeway",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "20620 Homestead Rd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "Safeway",
                "state" : "CA",
                "address2" : null
              },
              "alias" : "starbucks-cupertino-21",
              "coordinates" : {
                "longitude" : -122.03485000000001,
                "latitude" : 37.336586325001548
              },
              "attributes" : {
                "business_temp_closed" : null,
                "menu_url" : null,
                "waitlist_reservation" : null
              },
              "transactions" : [

              ],
              "distance" : 571.77423338742199,
              "name" : "Starbucks"
            },
            {
              "id" : "K6KLjqimhPvrjHE2AKM4ag",
              "is_closed" : false,
              "review_count" : 94,
              "categories" : [
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                }
              ],
              "rating" : 2.7000000000000002,
              "phone" : "+12063793845",
              "image_url" : "https://s3-media4.fl.yelpcdn.com/bphoto/rRULck1SsLDDb3SynAszlg/o.jpg",
              "url" : "https://www.yelp.com/biz/starbucks-cupertino-12?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 0,
                      "start" : "0530"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 1,
                      "start" : "0530"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 2,
                      "start" : "0530"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 3,
                      "start" : "0530"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 4,
                      "start" : "0530"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 5,
                      "start" : "0530"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 6,
                      "start" : "0530"
                    }
                  ]
                }
              ],
              "display_phone" : "(206) 379-3845",
              "price" : "$$",
              "location" : {
                "display_address" : [
                  "20676 W Homestead Rd",
                  "Homestead Square",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "20676 W Homestead Rd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : "Homestead Square"
              },
              "alias" : "starbucks-cupertino-12",
              "coordinates" : {
                "longitude" : -122.036405,
                "latitude" : 37.336785999999996
              },
              "attributes" : {
                "business_temp_closed" : null,
                "menu_url" : "http://www.starbucks.com/menu",
                "waitlist_reservation" : null
              },
              "transactions" : [
                "delivery"
              ],
              "distance" : 674.98692436068416,
              "name" : "Starbucks"
            },
            {
              "id" : "iMxvmdSfcBk0EnJAOrAKqA",
              "is_closed" : false,
              "review_count" : 32,
              "categories" : [
                {
                  "alias" : "juicebars",
                  "title" : "Juice Bars & Smoothies"
                },
                {
                  "alias" : "bubbletea",
                  "title" : "Bubble Tea"
                },
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                }
              ],
              "rating" : 3.5,
              "phone" : "+14082160441",
              "image_url" : "https://s3-media2.fl.yelpcdn.com/bphoto/JhMMKLaxxzncfCEmtKA3qA/o.jpg",
              "url" : "https://www.yelp.com/biz/mr-green-bubble-cupertino?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 0,
                      "start" : "1100"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 1,
                      "start" : "1100"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 2,
                      "start" : "1100"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 3,
                      "start" : "1100"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 4,
                      "start" : "1100"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 5,
                      "start" : "1100"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 6,
                      "start" : "1100"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 216-0441",
              "price" : "$$",
              "location" : {
                "display_address" : [
                  "10118 Bandley Dr",
                  "Ste G",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "10118 Bandley Dr",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : "Ste G"
              },
              "alias" : "mr-green-bubble-cupertino",
              "coordinates" : {
                "longitude" : -122.03415564108892,
                "latitude" : 37.324711362179478
              },
              "attributes" : {
                "business_temp_closed" : null,
                "menu_url" : "https://www.greenbubblecafe.com/menus",
                "waitlist_reservation" : null
              },
              "transactions" : [
                "pickup",
                "delivery"
              ],
              "distance" : 886.21257178457699,
              "name" : "Mr. Green Bubble"
            },
            {
              "id" : "5FdfHkqTwOvIKnukeb9pfw",
              "is_closed" : false,
              "review_count" : 153,
              "categories" : [
                {
                  "alias" : "sandwiches",
                  "title" : "Sandwiches"
                },
                {
                  "alias" : "breakfast_brunch",
                  "title" : "Breakfast & Brunch"
                },
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                }
              ],
              "rating" : 4.5,
              "phone" : "+14085644411",
              "image_url" : "https://s3-media2.fl.yelpcdn.com/bphoto/6Orlumul9gxwLuAs8doNww/o.jpg",
              "url" : "https://www.yelp.com/biz/oakmont-sandwiches-cupertino?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "1930",
                      "day" : 0,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1930",
                      "day" : 1,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1930",
                      "day" : 2,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1930",
                      "day" : 3,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1930",
                      "day" : 4,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1600",
                      "day" : 5,
                      "start" : "0800"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 564-4411",
              "price" : "$$",
              "location" : {
                "display_address" : [
                  "19998 Homestead Rd",
                  "Ste C",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "19998 Homestead Rd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : null,
                "state" : "CA",
                "address2" : "Ste C"
              },
              "alias" : "oakmont-sandwiches-cupertino",
              "coordinates" : {
                "longitude" : -122.02282200000001,
                "latitude" : 37.337229000000001
              },
              "attributes" : {
                "waitlist_reservation" : null,
                "business_temp_closed" : null,
                "menu_url" : null,
                "open24_hours" : null
              },
              "transactions" : [
                "pickup",
                "delivery"
              ],
              "distance" : 917.35525813634911,
              "name" : "Oakmont Sandwiches"
            },
            {
              "id" : "4FAxYaxeTXNtmxjf4k7J3w",
              "is_closed" : false,
              "review_count" : 2,
              "categories" : [
                {
                  "alias" : "cafes",
                  "title" : "Cafes"
                },
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                },
                {
                  "alias" : "breakfast_brunch",
                  "title" : "Breakfast & Brunch"
                }
              ],
              "rating" : 5,
              "phone" : "+14085644411",
              "image_url" : "https://s3-media3.fl.yelpcdn.com/bphoto/w_LG8bf5JAHEZcWEtPcAkg/o.jpg",
              "url" : "https://www.yelp.com/biz/brew-bytes-cafe-cupertino?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "1930",
                      "day" : 0,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1930",
                      "day" : 1,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1930",
                      "day" : 2,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1930",
                      "day" : 3,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1930",
                      "day" : 4,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1600",
                      "day" : 5,
                      "start" : "0800"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 564-4411",
              "location" : {
                "display_address" : [
                  "19998 Homestead Rd",
                  "Ste C",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "19998 Homestead Rd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : "Ste C"
              },
              "alias" : "brew-bytes-cafe-cupertino",
              "coordinates" : {
                "longitude" : -122.02282200000001,
                "latitude" : 37.337229000000001
              },
              "attributes" : {
                "waitlist_reservation" : null,
                "business_temp_closed" : null,
                "menu_url" : null,
                "open24_hours" : null
              },
              "transactions" : [

              ],
              "distance" : 917.35525813634911,
              "name" : "Brew Bytes Cafe"
            },
            {
              "id" : "44nT_uh-OqlSL-bUBpH40w",
              "is_closed" : false,
              "review_count" : 174,
              "categories" : [
                {
                  "alias" : "korean",
                  "title" : "Korean"
                },
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                },
                {
                  "alias" : "bubbletea",
                  "title" : "Bubble Tea"
                }
              ],
              "rating" : 4,
              "phone" : "+14083202677",
              "image_url" : "https://s3-media4.fl.yelpcdn.com/bphoto/XA_ANTPKd3xiNzrtYBmBcA/o.jpg",
              "url" : "https://www.yelp.com/biz/babo-boba-cafe-cupertino-9?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 1,
                      "start" : "1200"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 2,
                      "start" : "1200"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 3,
                      "start" : "1200"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 4,
                      "start" : "1200"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 5,
                      "start" : "1200"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 6,
                      "start" : "1200"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 320-2677",
              "price" : "$$",
              "location" : {
                "display_address" : [
                  "19960 Homestead Rd",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "19960 Homestead Rd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : null
              },
              "alias" : "babo-boba-cafe-cupertino-9",
              "coordinates" : {
                "longitude" : -122.02246426237728,
                "latitude" : 37.336952712181152
              },
              "attributes" : {
                "waitlist_reservation" : null,
                "business_temp_closed" : null,
                "menu_url" : "https://www.babobobabar.com/menu",
                "open24_hours" : null
              },
              "transactions" : [
                "pickup",
                "delivery"
              ],
              "distance" : 929.03819299258805,
              "name" : "Babo Boba Cafe"
            },
            {
              "id" : "3DNwxomphUIUOoqAl3fSqg",
              "is_closed" : false,
              "review_count" : 27,
              "categories" : [
                {
                  "alias" : "bubbletea",
                  "title" : "Bubble Tea"
                },
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                }
              ],
              "rating" : 3.7999999999999998,
              "phone" : "+16693424953",
              "image_url" : "https://s3-media4.fl.yelpcdn.com/bphoto/6AXW-b4k7UiL7K1pUleYQQ/o.jpg",
              "url" : "https://www.yelp.com/biz/shang-yu-lin-cupertino?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "2100",
                      "day" : 0,
                      "start" : "1130"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2100",
                      "day" : 1,
                      "start" : "1130"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2100",
                      "day" : 2,
                      "start" : "1130"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2100",
                      "day" : 3,
                      "start" : "1130"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2100",
                      "day" : 4,
                      "start" : "1130"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2100",
                      "day" : 5,
                      "start" : "1130"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2100",
                      "day" : 6,
                      "start" : "1130"
                    }
                  ]
                }
              ],
              "display_phone" : "(669) 342-4953",
              "location" : {
                "display_address" : [
                  "20956 Homestead Rd",
                  "Ste D",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "20956 Homestead Rd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : "Ste D"
              },
              "alias" : "shang-yu-lin-cupertino",
              "coordinates" : {
                "longitude" : -122.04030700433589,
                "latitude" : 37.336938936695311
              },
              "attributes" : {
                "business_temp_closed" : null,
                "menu_url" : null,
                "waitlist_reservation" : null
              },
              "transactions" : [

              ],
              "distance" : 952.95989879621732,
              "name" : "Shang Yu Lin"
            },
            {
              "id" : "Q0s4evO-h2RHNGRr5QFBAA",
              "is_closed" : false,
              "review_count" : 831,
              "categories" : [
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                },
                {
                  "alias" : "bubbletea",
                  "title" : "Bubble Tea"
                },
                {
                  "alias" : "taiwanese",
                  "title" : "Taiwanese"
                }
              ],
              "rating" : 3.7000000000000002,
              "phone" : "+14089969898",
              "image_url" : "https://s3-media3.fl.yelpcdn.com/bphoto/cMaQWVxGh0xZnLm-dFAqfA/o.jpg",
              "url" : "https://www.yelp.com/biz/tea-era-cupertino?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "2200",
                      "day" : 0,
                      "start" : "1100"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2200",
                      "day" : 1,
                      "start" : "1100"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2200",
                      "day" : 2,
                      "start" : "1100"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2200",
                      "day" : 3,
                      "start" : "1100"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2200",
                      "day" : 4,
                      "start" : "1100"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2200",
                      "day" : 5,
                      "start" : "1100"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2100",
                      "day" : 6,
                      "start" : "1100"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 996-9898",
              "price" : "$",
              "location" : {
                "display_address" : [
                  "20916 Homestead Rd",
                  "Ste F",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "20916 Homestead Rd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : "Ste F"
              },
              "alias" : "tea-era-cupertino",
              "coordinates" : {
                "longitude" : -122.04036263043756,
                "latitude" : 37.337186153732837
              },
              "attributes" : {
                "waitlist_reservation" : null,
                "business_temp_closed" : null,
                "menu_url" : null,
                "open24_hours" : null
              },
              "transactions" : [
                "pickup",
                "delivery"
              ],
              "distance" : 972.10133674866915,
              "name" : "Tea Era"
            },
            {
              "id" : "EunYm0tJuO70HyV6d4nJYw",
              "is_closed" : false,
              "review_count" : 353,
              "categories" : [
                {
                  "alias" : "sandwiches",
                  "title" : "Sandwiches"
                },
                {
                  "alias" : "vietnamese",
                  "title" : "Vietnamese"
                },
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                }
              ],
              "rating" : 3.2000000000000002,
              "phone" : "+14084465030",
              "image_url" : "https://s3-media3.fl.yelpcdn.com/bphoto/itDOGtOKLtbpMIpySqZQdw/o.jpg",
              "url" : "https://www.yelp.com/biz/lees-sandwiches-cupertino-2?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 0,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 1,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 2,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 3,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 4,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 5,
                      "start" : "0730"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1900",
                      "day" : 6,
                      "start" : "0730"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 446-5030",
              "price" : "$",
              "location" : {
                "display_address" : [
                  "20363 Stevens Creek Blvd",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "20363 Stevens Creek Blvd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : null
              },
              "alias" : "lees-sandwiches-cupertino-2",
              "coordinates" : {
                "longitude" : -122.02986670876,
                "latitude" : 37.323542551526003
              },
              "attributes" : {
                "waitlist_reservation" : null,
                "business_temp_closed" : null,
                "menu_url" : null,
                "open24_hours" : null
              },
              "transactions" : [
                "pickup",
                "delivery"
              ],
              "distance" : 984.55853283605097,
              "name" : "Lee's Sandwiches"
            },
            {
              "id" : "3SiogPemw1BxYXNIiuoSWA",
              "is_closed" : false,
              "review_count" : 26,
              "categories" : [
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                }
              ],
              "rating" : 3,
              "phone" : "+14087252651",
              "image_url" : "https://s3-media1.fl.yelpcdn.com/bphoto/I4awICJ_aNjFBRZG1xjtJA/o.jpg",
              "url" : "https://www.yelp.com/biz/starbucks-cupertino-8?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 0,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 1,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 2,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 3,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 4,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 5,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 6,
                      "start" : "0700"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 725-2651",
              "price" : "$$",
              "location" : {
                "display_address" : [
                  "20745",
                  "Ste vens Creek Boulevard",
                  "Target",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "20745",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "Target",
                "state" : "CA",
                "address2" : "Ste vens Creek Boulevard"
              },
              "alias" : "starbucks-cupertino-8",
              "coordinates" : {
                "longitude" : -122.03629662,
                "latitude" : 37.324184559999999
              },
              "attributes" : {
                "business_temp_closed" : null,
                "menu_url" : "http://www.starbucks.com/menu",
                "waitlist_reservation" : null
              },
              "transactions" : [
                "delivery"
              ],
              "distance" : 1011.0530731969947,
              "name" : "Starbucks"
            },
            {
              "id" : "ytUMBIz2IkLoX07kfWq8_w",
              "is_closed" : false,
              "review_count" : 155,
              "categories" : [
                {
                  "alias" : "hotdogs",
                  "title" : "Fast Food"
                },
                {
                  "alias" : "burgers",
                  "title" : "Burgers"
                },
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                }
              ],
              "rating" : 2.2999999999999998,
              "phone" : "+14082557576",
              "image_url" : "https://s3-media3.fl.yelpcdn.com/bphoto/ZEWINCr4kn44JyxJvXk84w/o.jpg",
              "url" : "https://www.yelp.com/biz/mcdonalds-cupertino-2?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "2300",
                      "day" : 0,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2300",
                      "day" : 1,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2300",
                      "day" : 2,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2300",
                      "day" : 3,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2300",
                      "day" : 4,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2300",
                      "day" : 5,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2300",
                      "day" : 6,
                      "start" : "0600"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 255-7576",
              "price" : "$",
              "location" : {
                "display_address" : [
                  "10990 N Stelling Rd",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "10990 N Stelling Rd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : ""
              },
              "alias" : "mcdonalds-cupertino-2",
              "coordinates" : {
                "longitude" : -122.04098999999999,
                "latitude" : 37.337200000000003
              },
              "attributes" : {
                "waitlist_reservation" : null,
                "business_temp_closed" : null,
                "menu_url" : "https://www.mcdonalds.com/us/en-us/full-menu.html?cid=PS:GCM_MOP:NB::Yelp:All",
                "open24_hours" : null
              },
              "transactions" : [
                "delivery"
              ],
              "distance" : 1021.4431253403194,
              "name" : "McDonald's"
            },
            {
              "id" : "FvEmY-QOjaySOaxnA0cFig",
              "is_closed" : false,
              "review_count" : 491,
              "categories" : [
                {
                  "alias" : "bakeries",
                  "title" : "Bakeries"
                },
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                },
                {
                  "alias" : "cakeshop",
                  "title" : "Patisserie/Cake Shop"
                }
              ],
              "rating" : 3.2999999999999998,
              "phone" : "+14089960704",
              "image_url" : "https://s3-media3.fl.yelpcdn.com/bphoto/6Y8hTUnjeFkTfzp4oYLkwQ/o.jpg",
              "url" : "https://www.yelp.com/biz/paris-baguette-cupertino?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "2030",
                      "day" : 0,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2030",
                      "day" : 1,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2030",
                      "day" : 2,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2030",
                      "day" : 3,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2100",
                      "day" : 4,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2100",
                      "day" : 5,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2030",
                      "day" : 6,
                      "start" : "0700"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 996-0704",
              "price" : "$$",
              "location" : {
                "display_address" : [
                  "20735 Stevens Creek Blvd",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "20735 Stevens Creek Blvd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : ""
              },
              "alias" : "paris-baguette-cupertino",
              "coordinates" : {
                "longitude" : -122.03533988446,
                "latitude" : 37.323435874740198
              },
              "attributes" : {
                "business_temp_closed" : null,
                "menu_url" : "https://www.parisbaguette.com/menu/",
                "waitlist_reservation" : null
              },
              "transactions" : [
                "delivery"
              ],
              "distance" : 1054.1261694848836,
              "name" : "Paris Baguette"
            },
            {
              "id" : "R4ISdv8FUCkSwucO8sZSIw",
              "is_closed" : false,
              "review_count" : 1010,
              "categories" : [
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                },
                {
                  "alias" : "breakfast_brunch",
                  "title" : "Breakfast & Brunch"
                }
              ],
              "rating" : 4.2999999999999998,
              "phone" : "+14084469000",
              "image_url" : "https://s3-media2.fl.yelpcdn.com/bphoto/OiSF5bt9AtsagTRUYNiXIw/o.jpg",
              "url" : "https://www.yelp.com/biz/philz-coffee-cupertino-8?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "1800",
                      "day" : 0,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1800",
                      "day" : 1,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1800",
                      "day" : 2,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1800",
                      "day" : 3,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1800",
                      "day" : 4,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1800",
                      "day" : 5,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1800",
                      "day" : 6,
                      "start" : "0600"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 446-9000",
              "price" : "$",
              "location" : {
                "display_address" : [
                  "20686 Stevens Creek Blvd",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "20686 Stevens Creek Blvd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : ""
              },
              "alias" : "philz-coffee-cupertino-8",
              "coordinates" : {
                "longitude" : -122.03468850224176,
                "latitude" : 37.322560179453575
              },
              "attributes" : {
                "waitlist_reservation" : null,
                "business_temp_closed" : null,
                "menu_url" : null,
                "open24_hours" : null
              },
              "transactions" : [
                "delivery"
              ],
              "distance" : 1128.997878047589,
              "name" : "Philz Coffee"
            },
            {
              "id" : "iO4VrF2nVM15ODOCdf37cg",
              "is_closed" : false,
              "review_count" : 314,
              "categories" : [
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                }
              ],
              "rating" : 3.5,
              "phone" : "+14089738358",
              "image_url" : "https://s3-media2.fl.yelpcdn.com/bphoto/Y8iMZGHkdGhMQOnYu3iWMQ/o.jpg",
              "url" : "https://www.yelp.com/biz/starbucks-cupertino-23?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 0,
                      "start" : "0500"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 1,
                      "start" : "0500"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 2,
                      "start" : "0500"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 3,
                      "start" : "0500"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 4,
                      "start" : "0500"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 5,
                      "start" : "0600"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 6,
                      "start" : "0600"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 973-8358",
              "price" : "$$",
              "location" : {
                "display_address" : [
                  "20520A Stevens Creek Blvd",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "20520A Stevens Creek Blvd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : ""
              },
              "alias" : "starbucks-cupertino-23",
              "coordinates" : {
                "longitude" : -122.0328525,
                "latitude" : 37.321992911113689
              },
              "attributes" : {
                "business_temp_closed" : null,
                "menu_url" : "http://www.starbucks.com/menu",
                "waitlist_reservation" : null
              },
              "transactions" : [
                "delivery"
              ],
              "distance" : 1158.6296906934201,
              "name" : "Starbucks"
            },
            {
              "id" : "e8r3DzJyqXPISkUZ89IkDA",
              "is_closed" : false,
              "review_count" : 308,
              "categories" : [
                {
                  "alias" : "coffeeroasteries",
                  "title" : "Coffee Roasteries"
                },
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                }
              ],
              "rating" : 4.4000000000000004,
              "phone" : "+14083202325",
              "image_url" : "https://s3-media3.fl.yelpcdn.com/bphoto/nTeebijOTuGxkzJqkIJKrA/o.jpg",
              "url" : "https://www.yelp.com/biz/voyager-craft-coffee-cupertino?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 0,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 1,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 2,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 3,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 4,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 5,
                      "start" : "0700"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 6,
                      "start" : "0700"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 320-2325",
              "price" : "$$",
              "location" : {
                "display_address" : [
                  "20807 Stevens Creek Blvd",
                  "Ste 200",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "20807 Stevens Creek Blvd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : "Ste 200"
              },
              "alias" : "voyager-craft-coffee-cupertino",
              "coordinates" : {
                "longitude" : -122.0380636,
                "latitude" : 37.323278403421355
              },
              "attributes" : {
                "business_temp_closed" : null,
                "menu_url" : null,
                "waitlist_reservation" : null
              },
              "transactions" : [

              ],
              "distance" : 1174.583517603141,
              "name" : "Voyager Craft Coffee"
            },
            {
              "id" : "3tLIr1YQs5IWhpw3qv7haA",
              "is_closed" : false,
              "review_count" : 51,
              "categories" : [
                {
                  "alias" : "bubbletea",
                  "title" : "Bubble Tea"
                },
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                },
                {
                  "alias" : "juicebars",
                  "title" : "Juice Bars & Smoothies"
                }
              ],
              "rating" : 4.4000000000000004,
              "phone" : "+16693425951",
              "image_url" : "https://s3-media4.fl.yelpcdn.com/bphoto/2dv3kvMiKOoCvjYtvPVBXg/o.jpg",
              "url" : "https://www.yelp.com/biz/rose-tea-lounge-cupertino-cupertino?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 0,
                      "start" : "1200"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 1,
                      "start" : "1200"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 2,
                      "start" : "1200"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 3,
                      "start" : "1200"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2100",
                      "day" : 4,
                      "start" : "1200"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2100",
                      "day" : 5,
                      "start" : "1200"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "2000",
                      "day" : 6,
                      "start" : "1200"
                    }
                  ]
                }
              ],
              "display_phone" : "(669) 342-5951",
              "price" : "$$",
              "location" : {
                "display_address" : [
                  "20080 Stevens Creek Blvd",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "20080 Stevens Creek Blvd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : "",
                "state" : "CA",
                "address2" : null
              },
              "alias" : "rose-tea-lounge-cupertino-cupertino",
              "coordinates" : {
                "longitude" : -122.02467129999999,
                "latitude" : 37.322689137020909
              },
              "attributes" : {
                "business_temp_closed" : null,
                "menu_url" : "https://rosetealounge.com/menu/",
                "waitlist_reservation" : false
              },
              "transactions" : [

              ],
              "distance" : 1218.4787527150029,
              "name" : "Rose Tea Lounge - Cupertino"
            },
            {
              "id" : "wSiU3afabpmw8PpeuagDug",
              "is_closed" : false,
              "review_count" : 0,
              "categories" : [
                {
                  "alias" : "coffee",
                  "title" : "Coffee & Tea"
                },
                {
                  "alias" : "coffeeroasteries",
                  "title" : "Coffee Roasteries"
                }
              ],
              "rating" : 0,
              "phone" : "+14082577000",
              "image_url" : "https://s3-media3.fl.yelpcdn.com/bphoto/_WIUdZXwRPDHz9FVRg3NHw/o.jpg",
              "url" : "https://www.yelp.com/biz/wfm-coffee-bar-cupertino?adjust_creative=7NZsL01YfTh_zNY-HObD7Q&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=7NZsL01YfTh_zNY-HObD7Q",
              "business_hours" : [
                {
                  "hours_type" : "REGULAR",
                  "is_open_now" : true,
                  "open" : [
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 0,
                      "start" : "0800"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 1,
                      "start" : "0800"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 2,
                      "start" : "0800"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 3,
                      "start" : "0800"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 4,
                      "start" : "0800"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 5,
                      "start" : "0800"
                    },
                    {
                      "is_overnight" : false,
                      "end" : "1700",
                      "day" : 6,
                      "start" : "0800"
                    }
                  ]
                }
              ],
              "display_phone" : "(408) 257-7000",
              "location" : {
                "display_address" : [
                  "20955 Stevens Creek Blvd",
                  "Cupertino, CA 95014"
                ],
                "city" : "Cupertino",
                "address1" : "20955 Stevens Creek Blvd",
                "zip_code" : "95014",
                "country" : "US",
                "address3" : null,
                "state" : "CA",
                "address2" : null
              },
              "alias" : "wfm-coffee-bar-cupertino",
              "coordinates" : {
                "longitude" : -122.0396621,
                "latitude" : 37.323497500000002
              },
              "attributes" : {
                "business_temp_closed" : null,
                "menu_url" : null,
                "waitlist_reservation" : null
              },
              "transactions" : [

              ],
              "distance" : 1233.7960414959398,
              "name" : "WFM Coffee Bar"
            }
          ],
          "total" : 1000,
          "region" : {
            "center" : {
              "longitude" : -122.0312186,
              "latitude" : 37.332331410000002
            }
          }
        }

        """
        
        return Data(jsonString.utf8)
    }
}




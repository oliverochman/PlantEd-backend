Plant.destroy_all
User.destroy_all
UserPlant.destroy_all
binding.pry

plants = Plant.create([
  {name: 'Aloe Vera', file: File.new(Rails.root.join('images','plant_images', 'aleo_vera.jpg')), description: 'The Aloe Vera plant (succulent type) is well known for offering possible health and beauty benefits. This succulent is a tough species that is very easy to care for and rarely presents problems for most growers.'},
  {name: 'Snake plant', image_file_name: 'snake_plant.jpg', description: 'This carefree, tough succulent grows almost anywhere. Snake plant (Sansevieria spp.) tolerates neglect but responds nicely to good care. '},
  {name: 'Peace lily', image_file_name: 'peace_lilly.jpg', description: 'The easy-care peace lily (Spathiphyllum wallisii) tolerates low humidity and low light. Its glossy, lance-shape leaves tip arching stems that surround the central flower spikes.'},
  {name: 'English ivy', image_file_name: 'english_ivy.jpg', description: 'This versatile foliage plant’s dainty demeanor makes it suitable for hanging baskets or pots. It’s among the best houseplants for training on topiary forms or using as a groundcover beneath larger houseplants.'},
  {name: 'Florist’s Chrysanthemum', image_file_name: 'florists_chrysanthemum.jpg', description: 'Sometimes called Florist’s daisy or Hardy Garden Mum, this houseplant is another popular perennial plant that people like to have in their home. Unlike the Peace Lily, this houseplant loves direct sunlight and a medium amount of water.'},
  {name: 'Devil’s Ivy', image_file_name: 'devil_ivy.jpg', description: 'Often called Devil’s Ivy or Golden Pothos, this popular houseplant is native to the Soloman Islands, but is can be found growing all over the world. With evergreen vines and small green heart-shaped leaves marbled with yellowish-white hues, this houseplant is commonly sold in decorative hanging baskets. It is best to keep Epipremnum aureum near a window, without direct sunlight shining down on it. The soil should be peaty with lots of moisture.'},
  {name: 'Red-Edged Dracaena', image_file_name: 'red_edged_drac.jpg', description: 'This low-maintenance plant is extremely popular in America not just because it looks cool, but also because it takes little work to keep it alive. All you need to do to keep this plant alive, is keep it in an area with indirect sunlight and keep the soil slightly moist.'},
  {name: 'Lady Palm', image_file_name: 'ladypalm.jpg', description: 'With a maximum height of approximately six feet, Rhapis excelsa is the perfect fan palm to have in a dark corner of your home. They are able to tolerate low-levels of light, high amounts of water and a wide range of temperatures. While this houseplant does prefer to live in moist soil, it does need to have the proper drainage available to avoid root rot.'},
  {name: 'Lucky bamboo', image_file_name: 'lucky_bamboo.jpeg', description: 'Lucky bamboo is not a bamboo at all, but a plant belongs to Dracaena genus. It is an easy-care houseplant. Just provide it abundant water and it’ll grow well even in indirect light. Tip: Protect the plant from drafts, provide iron fertilizer occasionally.'},
  {name: 'Barberton Daisy', image_file_name: 'barberton_daisy.jpg', description: 'Barberton daisy’s prefer full sun, plenty of water and well-drained soil. If you try to use this as an indoor houseplant, make sure you have it in an area that has plenty of natural light. It also thrives in moist soil. Be sure to keep the soil moist as often as possible, without over-watering it.'},
  {name: 'Weeping Fig', image_file_name: 'weeping_fig.jpg', description: 'This low-maintenance, evergreen plant grows well both inside and out. If you use it as a houseplant, place it in an area that has plenty of bright indirect natural light. If you place it directly in the sun, it’s possible that the leaves will burn. Water it frequently, but to avoid root rot allow the soil to dry before adding more water.'},
  {name: 'Jade Plant', image_file_name: 'jade_plant.jpg', description: 'When grown indoors, jade plant attains size like a small shrub. Keep the plant on a spot that receives partial or indirect sunlight. This plant is extremely tolerant of poor soils and its thick leaves and stems act as reservoirs of water. This feature makes it one of the best plant for indoor gardening.'},
  {name: 'Ponytail Palm/Elephant’s foot', image_file_name: 'elephant_foot', description: 'The Ponytail Palm is not really a palm at all but a succulent from the lily family. It is an elegant and strange looking house plant. It is known as Elephant’s foot because of its swollen trunk, which is due to water storage. It is an easy growing houseplant that is long-lived. However, it is slow growing but tolerates dry air and thrives even in the strongly heated room. Tip: Avoid frequent watering, watering should be done only when the soil is dry.'},
  {name: 'ZZ Plant', image_file_name: 'zz_plant.jpg', description: 'ZZ plant is a tropical plant native to eastern Asia. The leaves of the ZZ plant are strong and glossy and look somewhat like those of Zamias. The ZZ plant is probably the easiest plant to maintain in our list. This plant requires only little light and almost appreciate all types of environments. Tip: ZZ plant does not like frequent watering and wet feet.'},
  {name: 'Spider plant', image_file_name: 'spider_plant.jpg', description: 'One of the most popular houseplants. Its popularity is due to its toughness and the ease of propagation and maintenance. The plant can adapt to almost any condition. Tip: Keep the plant on a bright spot and maintain slight moisture in the soil.'},
  {name: 'Umbrella Tree', image_file_name: 'umbrella_tree.jpg', description: 'Very common in offices and homes, this beautiful tropical tree becomes a low care and tall houseplant when grown indoors. Tip: Avoid overwatering. Keep your plant on a bright spot of your home or office that receives indirect sun.'},
  {name: 'Dieffenbachia', image_file_name: 'dieffenbachia.jpg', description: 'Perfect for those looking for house plant adapted to low light. Dieffenbachias grow well in shade. Just keep the soil evenly moist and well drained and maintain the moderate room temperature. Tip: Let the top surface dry out slightly between watering spells, ensure proper drainage.'},
  {name: 'Fiddle leaf fig', image_file_name: 'fiddle_leaf_fig.jpg', description: 'Fiddle leaf fig is a tough houseplant. Its large leathery foliage and height create a statement in the drawing room.'},
  {name: 'Rubber Tree', image_file_name: 'rubber_tree.jpg', description: 'A natural air purifier, rubber tree is an excellent and easy to grow houseplant. Besides occasional pruning and repotting, the maintenance of rubber tree plant is simple.'},
  {name: 'Cast-Iron Plant', image_file_name: 'cast_iron_plant.jpg', description: 'One of the toughest plants you can grow, cast-iron plant withstands neglect, low light, low humidity, and a wide range of temperatures.'},
  {name: 'Philodendron', image_file_name: 'philodendron.jpg', description: 'Philodendrons are one of the common houseplants you can grow. There are several charming varieties, so you can easily find one that suits your style. These plants require moderate watering and actually prefer dry soil between watering sessions.'},
  {name: 'Chinese Evergreen', image_file_name: 'chinese_evergreen.jpg', description: 'According to the Southern living magazine Chinese evergreen is the easiest houseplant. This is the plant you can grow without sunlight.'},
  {name: 'Hoya', image_file_name: 'hoya.jpg', description: 'With beautiful waxy foliage and fragrant flowers, hoya looks beautiful. It has a low watering requirement and doesn’t mind if you forget to water.'},
  {name: 'Boston Fern', image_file_name: 'boston_fern.jpg', description: 'This low-maintenance plant is a good choice for people who want a no-fuss, lush look in their home. Boston ferns mainly need a cool place, with high humidity and indirect light. If you can manage those three basic needs, you will have a green friend for years.'},
  {name: 'Dracaena', image_file_name: 'dracaena.jpg', description: 'If you are looking to spruce up your floorspace, look to this easy-to-handle plant. All you have to do is keep it dry and somewhere on the warm side, as they do best in temperatures between 65 degrees and 80 degrees. Dracaena also like plenty of light, so a sunny window spot will be handy too.'}
                      ])

user = User.create(
    email: 'whatever@hotmail.com',
    password: 'whatever',
    password_confirmation: 'whatever'
)

user2 = User.create(
    email: 'mariza@hotmail.com',
    password: 'ilovereact',
    password_confirmation: 'ilovereact'
)

plants.each do |plant|
  UserPlant.create(user_id: user.id, plant_id: plant.id)
end

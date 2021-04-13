# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'uri'
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

if Rails.env.development?
  Color.destroy_all
  Plant.destroy_all
  User.destroy_all
  Category.destroy_all
  Sun.destroy_all
  WaterPeriod.destroy_all
  puts 'Last seeds destroyed'
end


puts 'Seeding users'

borgesmalu = User.create!(
  name: "Maria Luiza Borges",
  email: "borges.malu@gmail.com",
  password: "nni6mug8",
  phone: "(21)993444535",
  address: "R. Vice Gov. Rubens Berardo, 65",
  address_complement:  "Bloco 2 - apt 307",
  suburb: "Gávea",
  zip_code: "22451070",
  location_details: "Em frente ao Planetário da Gávea",
  admin: true
  )


gustavoborges = User.create!(
  name: "Gustavo Borges",
  email: "gustborges@gmail.com",
  password: "nni7mug9",
  phone: "(21)967808889",
  address: "R. Almirante Alexandrino, 1310",
  address_complement: "Apt 201",
  suburb: "Santa Teresa",
  zip_code: "20241260",
  location_details: "Ao lado da Clínica Saint Romain",
  admin: true
  )

cliente = User.create!(
  name: "Max Lima",
  email: "maxlimascm@gmail.com",
  password: "raguzinho",
  phone: "(21)983120921",
  address: "R. Almirante Alexandrino, 1310",
  address_complement: "Apt 201",
  suburb: "Santa Teresa",
  zip_code: "20241260",
  location_details: "Em frente ao Castelinho Valentim",
  admin: false
  )

puts 'Capturing sun light'

sol = Sun.create!(
  amount: "Sol"
  )

meia_sombra = Sun.create!(
  amount: "Meia Sombra"
  )

sombra = Sun.create!(
  amount: "Sombra"
  )

puts 'Watering'

raramente = WaterPeriod.create!(
  amount: "Raramente"
  )

frequencia_media = WaterPeriod.create!(
  amount: "Frequência Média"
  )

todo_dia = WaterPeriod.create!(
  amount: "Todo dia"
  )


puts 'Putting some colors on it'

bandeira = Color.create!(
  name: "Verde Bandeira",
  hex: "#228b22"
  )

lima = Color.create!(
  name: "Verde Lima",
  hex: "#5EE045"
  )

abacate = Color.create!(
  name: "Verde Abacate",
  hex: "#faed9c"
  )

escuro = Color.create!(
  name: "Verde Escuro",
  hex: "#006400"
  )

lapis = Color.create!(
  name: "Azul Lápis Lazuli",
  hex: "#00F"
  )

capri = Color.create!(
  name: "Azul Capri",
  hex: "#2ee2ff"
  )

marinho = Color.create!(
  name: "Azul Marinho",
  hex: "#00008b"
  )

canario = Color.create!(
  name: "Amarelo Canário",
  hex: "#FF0"
  )

acafrao = Color.create!(
  name: "Amarelo Açafrão",
  hex: "#FFBF00"
  )

vermelho = Color.create!(
  name: "Vermelho",
  hex: "#F00"
  )

carmim = Color.create!(
  name: "Carmim",
  hex: "#8B0000"
  )

laranja = Color.create!(
  name: "Laranja",
  hex: "#F44611"
  )

salmao = Color.create!(
  name: "Salmão",
  hex: "#FA7F72"
  )

magenta = Color.create!(
  name: "Magenta",
  hex: "#F0F"
  )

violeta = Color.create!(
  name: "Violeta",
  hex: "#606"
  )

sisal = Color.create!(
  name: "Sisal",
  hex: "#DAC8B3"
  )

marrom_claro = Color.create!(
  name: "Marrom Claro",
  hex: "#BB9469"
  )

amendoado = Color.create!(
  name: "Marrom Amendoado",
  hex: "#964B00"
  )

branco = Color.create!(
  name: "Branco",
  hex: "#FFFAFA"
  )

turquesa = Color.create!(
  name: "Azul Turquesa",
  hex: "#00CED1"
  )

rustico = Color.create!(
  name: "Rústico - Sem fios",
  hex: "#FFF"
  )

surpreendame = Color.create!(
  name: "Surpreenda-me",
  hex: "#FFF"
  )

puts 'Adding categories'

kokedama = Category.create!(
  name: "Kokedama"
  )

pote = Category.create!(
  name: "Pote"
  )

puts 'Finally, seeding plants'

caperata = Plant.create!(
  name: "Peperômia Melancia",
  scientific_name: "Peperomia Caperata",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 79,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618322000/nufiu/Peperomia_caperata_7-2_fdliiu.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
caperata.photo.attach(io: file, filename: filename)
caperata.save!

maranta = Plant.create!(
  name: "Maranta P",
  scientific_name: "Maranta Leuconeura",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 98,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 20 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sombra,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321999/nufiu/maranta1-2_r3ghjg.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
maranta.photo.attach(io: file, filename: filename)
maranta.save!


singonio = Plant.create!(
  name: "Singônio",
  scientific_name: "Syngonium angustatum",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 79,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 40 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321997/nufiu/Singo%CC%82nio_-_NUEM0016-2_eojadc.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
singonio.photo.attach(io: file, filename: filename)
singonio.save!


elefante = Plant.create!(
  name: "Pata de Elefante",
  scientific_name: "Beucarnea recurvata",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 89,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321996/nufiu/Produtos_Nuv_OOO-84-2_nb0mod.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
elefante.photo.attach(io: file, filename: filename)
elefante.save!


lanca = Plant.create!(
  name: "Lança de São Jorge",
  scientific_name: "Sansevieria cylindrica",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 94,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321990/nufiu/lanc%CC%A7a-2_mstykr.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
lanca.photo.attach(io: file, filename: filename)
lanca.save!


hedera = Plant.create!(
  name: "Hedera Verde ou Variegata",
  scientific_name: "Hedera helix",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 98,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Base com 15 cm de diâmetro",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321988/nufiu/hedera-2_xertry.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
hedera.photo.attach(io: file, filename: filename)
hedera.save!


dracena_compacta = Plant.create!(
  name: "Dracena Compacta",
  scientific_name: "Dracaena",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 80,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 20 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321985/nufiu/dracena-2_jvywst.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
dracena_compacta.photo.attach(io: file, filename: filename)
dracena_compacta.save!


filodendro = Plant.create!(
  name: "Filodendro/Guaimbê",
  scientific_name: "Philodendron bipinnatifidum",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 98,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 40 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321983/nufiu/filodendro-2_ywqnxe.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
filodendro.photo.attach(io: file, filename: filename)
filodendro.save!


felicidade_femea = Plant.create!(
  name: "Árvore da Felicidade (macho ou fêmea)",
  scientific_name: "Polyscias fruticosa",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 107,
  pet_friendly: false,
  water_text: "Rega 2 vezes por semana",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: frequencia_media,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321976/nufiu/felicidade_femea1-2_neaonw.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
felicidade_femea.photo.attach(io: file, filename: filename)
felicidade_femea.save!


espadinha = Plant.create!(
  name: "Espadinha de São Jorge",
  scientific_name: "Sansevieria trifasciata",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 68,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 20 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321976/nufiu/espadinha_coroa-2_dfda2a.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
espadinha.photo.attach(io: file, filename: filename)
espadinha.save!


asplenio_g = Plant.create!(
  name: "Asplênio G",
  scientific_name: "Asplenium nidus",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 161,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 25 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321964/nufiu/asplenio-2_mprrwy.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
asplenio_g.photo.attach(io: file, filename: filename)
asplenio_g.save!


asplenio_m = Plant.create!(
  name: "Asplênio M",
  scientific_name: "Asplenium nidus",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 98,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 20 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321964/nufiu/asplenio-2_mprrwy.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
asplenio_m.photo.attach(io: file, filename: filename)
asplenio_m.save!


asplenio_p = Plant.create!(
  name: "Asplênio P",
  scientific_name: "Asplenium nidus",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 71,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 10 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321964/nufiu/asplenio-2_mprrwy.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
asplenio_p.photo.attach(io: file, filename: filename)
asplenio_p.save!


aspargus = Plant.create!(
  name: "Aspargo alfinete G",
  scientific_name: "Aspargus densiflorus",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 98,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Base com diâmetro de 20cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321971/nufiu/aspargus_alfinete-2_sscbhz.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
aspargus.photo.attach(io: file, filename: filename)
aspargus.save!


croton = Plant.create!(
  name: "Cróton",
  scientific_name: "Codiaeum variegatum",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 134,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 45 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321970/nufiu/cro%CC%81ton-2_xbfwrw.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
croton.photo.attach(io: file, filename: filename)
croton.save!


columeia = Plant.create!(
  name: "Columeia-peixinho",
  scientific_name: "Nematanthus wettsteinii",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 89,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 25 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321970/nufiu/columeia-2_cgtthc.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
columeia.photo.attach(io: file, filename: filename)
columeia.save!


bromelia = Plant.create!(
  name: "Bromélia Neoregelia",
  scientific_name: "Neoregelia vandarm",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 134,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Base com diâmetro de 15cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321967/nufiu/bromelia1-2_q2yywb.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
bromelia.photo.attach(io: file, filename: filename)
bromelia.save!

cheflera = Plant.create!(
  name: "Cheflera",
  scientific_name: "Schefflera arboricola",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 134,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 45 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321967/nufiu/cheflera-2_ymjh1k.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
cheflera.photo.attach(io: file, filename: filename)
cheflera.save!

cissus = Plant.create!(
  name: "Cissus",
  scientific_name: "Cissus rhombifolia",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 94,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321966/nufiu/Cissus_-_NUEM0035-2_r0cz5t.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
cissus.photo.attach(io: file, filename: filename)
cissus.save!

chameadora = Plant.create!(
  name: "Areca/Camedória-elegante",
  scientific_name: "Chamaedorea elegans",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 71,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321964/nufiu/chameadora-2_vazfni.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
chameadora.photo.attach(io: file, filename: filename)
chameadora.save!

mini_cactus = Plant.create!(
  name: "Cactus Mini",
  scientific_name: "Cactus (diversos)",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 53,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 15 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321958/nufiu/cactus_mini-2_cfabhu.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
mini_cactus.photo.attach(io: file, filename: filename)
mini_cactus.save!

anturio = Plant.create!(
  name: "Antúrio",
  scientific_name: "Anthurium andraeanum",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 89,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura de até 40cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321957/nufiu/anturio1-2_cpg8g9.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
anturio.photo.attach(io: file, filename: filename)
anturio.save!

afelandra = Plant.create!(
  name: "Afelandra",
  scientific_name: "Aphelandra squarrosa",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 80,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 25 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321776/nufiu/afelandra_pdpyq2.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
afelandra.photo.attach(io: file, filename: filename)
afelandra.save!

costela_de_adao = Plant.create!(
  name: "Costela de Adão P",
  scientific_name: "Monstera deliciosa",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 260,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 45 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321969/nufiu/Costela_de_ada%CC%83o_-_NUEM0036-2_cf35v2.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
costela_de_adao.photo.attach(io: file, filename: filename)
costela_de_adao.save!

costela_de_adao_g = Plant.create!(
  name: "Costela de Adão G",
  scientific_name: "Monstera deliciosa",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 350,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 70 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: raramente,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321969/nufiu/Costela_de_ada%CC%83o_-_NUEM0036-2_cf35v2.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
costela_de_adao_g.photo.attach(io: file, filename: filename)
costela_de_adao_g.save!

lumina = Plant.create!(
  name: "Lumina",
  scientific_name: "Chlorophytum orchidastrum",
  description: "O destaque da Lumina fica, sem dúvida, por conta de sua belíssima folhagem. O contraste do caule alaranjado, que se revela a partir do centro da planta, entre as vistosas folhas verdes onduladas, conferiu à planta o nome popular pelo qual este clorofito é chamado aqui no Brasil.

A lumina é uma planta bastante resistente, que requer muito pouca manutenção. Seu cultivo é bem tranquilo, de modo que a planta lumina é uma opção ideal para os jardineiros de apartamento. Embora seja uma espécie de origem tropical, o Chlorophytum orchidastrum não gosta do sol pleno, situação que pode causar danos e queimaduras às suas folhas. O ideal é que a lumina seja mantida em um lugar com bastante luminosidade indireta, próxima a uma janela, protegida da incidência direta dos raios solares.
",
  price: 116,
  pet_friendly: true,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 25 cm",
  best_seller: false,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: frequencia_media,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321987/nufiu/Lumina_-_NUEM0024-2_rkjlel.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
lumina.photo.attach(io: file, filename: filename)
lumina.save!


jiboia = Plant.create!(
  name: "Jiboia",
  scientific_name: "Epipremnum pinnatum",
  description: "A jiboia é extremamente adaptável ao ambiente que está sendo cultivada. Em vasos e cachepôs, a planta se mantém pequena e reservada; quando suspensa, deixa seus caules e folhas pendentes, criando uma espécie de cortina verde super charmosa — alternativa perfeita para decorar qualquer espaço.

Sua folhagem se adapta bem aos ambientes com sombra, mas cresce melhor e mais rápido em locais com luz indireta. A única coisa que ela não suporta são as baixas temperaturas!

Em estações quentes e secas, como a primavera e o verão, as regas devem ser feitas de duas a três vezes por semana. Já no outono e no inverno, quando o ar está mais frio e úmido, é preciso diminuir a frequência da irrigação: uma a duas vezes por semana é o suficiente.
",
  price: 89,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 25 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sombra,
  water_period: raramente,
  published: true
  )
  
url = "https://res.cloudinary.com/gustborges/image/upload/v1618321991/nufiu/jiboia-2_ggdbj1.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
jiboia.photo.attach(io: file, filename: filename)
jiboia.save!

espada = Plant.create!(
  name: "Espada de São Jorge P",
  scientific_name: "Epipremnum pinnatum",
  description: "Ligada por muitos ao místico, a espada de São Jorge é uma planta lindíssima e que está super em alta. É conhecida por ser uma das melhores espécies de plantas com ação purificadora para os ambientes e energias. Suas propriedades permitem que ela absorva substâncias tóxicas do ar durante o dia, enquanto à noite libera oxigênio limpo. Esse efeito auxilia na purificação dos cômodos da casa.

A Espada de São Jorge exige poucos cuidados. Não precisa de muita adubação, se adapta bem tanto ao Sol, quanto à sombra e não precisa de muita rega. Ou seja, é ideal para quem quer uma planta em casa, mas sem ter muito trabalho. É uma planta bastante resistente e que sobrevive em áreas rnas com sol e também em áreas internas com menos incidência de luz e vento.

",
  price: 71,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 30 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: frequencia_media,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321989/nufiu/espada-2_ntpgek.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
espada.photo.attach(io: file, filename: filename)
espada.save!

comigo_ninguem_pode = Plant.create!(
  name: "Comigo ninguém pode",
  scientific_name: "Dieffenbachia seguine",
  description: "Essa planta tóxica da família Araceae possui folhas vistosas com manchas esbranquiçadas características, frutos na forma de baga e flores em espádice. Originária da Amazônia, essa herbácea tem vastas possibilidades de usos – desde decoração até eliminação de pragas e insetos.

Diferentemente de grande parte das plantas para cultivo doméstico, não é recomendado que essa planta seja exposta diretamente ao sol durante todo o tempo, de modo que é melhor que ela esteja em áreas onde há abundância de sombra durante a movimentação do sol.
É importante frisar que, apesar de bastante bonitas, algumas plantas ornamentais possuem grande potencial para provocar acidentes graves, como é o caso da comigo-ninguém-pode. Assim sendo, antes de adquirir qualquer produto, é importante avaliar os riscos e quem poderá ter acesso a essas plantas.
",
  price: 116,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 35 cm",
  best_seller: false,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: todo_dia,
  published: true
  )
  url = "https://res.cloudinary.com/gustborges/image/upload/v1618321969/nufiu/Comigo-Ningue%CC%81m-Pode_-_NUEM0003-2_csujev.jpg"
  filename = File.basename(URI.parse(url).path)
  file = URI.open(url)
  comigo_ninguem_pode.photo.attach(io: file, filename: filename)
  comigo_ninguem_pode.save!

pacova = Plant.create!(
  name: "Pacová",
  scientific_name: "Philodendron martianum",
  description: "Dono de folhas de um verde intenso e brilhante, o Pacová é uma espécie nativa do Brasil, encontrada aos montes em regiões cobertas pela Mata Atlântica (SP, RJ e no PR). Como seu ambiente nativo tem clima quente e úmido, o pacová não é muito fã de baixas temperaturas.

Recomendamos cultivá-lo em áreas de luz indireta, ou à meia-sombra – com incidência de sol ameno do início ou fim do dia. Gosta de rega moderada, em geral 1 vez por semana é suficiente. Apesar de ser uma espécie tropical, é preciso sempre observar como ela reage à luminosidade.

",
  price: 134,
  pet_friendly: true,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sombra,
  water_period: todo_dia,
  published: true
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1618321995/nufiu/pacova-2_hkzjqr.jpg"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
pacova.photo.attach(io: file, filename: filename)
pacova.save!
puts 'All done!'

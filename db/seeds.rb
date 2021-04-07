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

costela_de_adao = Plant.create!(
  name: "Costela de Adão",
  scientific_name: "Monstera deliciosa",
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
  water_period: raramente
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1615407820/nufiu/5qib3rn3j5n6st48r4cm87dn4cih.png"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
costela_de_adao.photo.attach(io: file, filename: filename)
costela_de_adao.save!

lumina = Plant.create!(
  name: "Lumina",
  scientific_name: "Chlorophytum orchidastrum",
  description: "O destaque da Lumina fica, sem dúvida, por conta de sua belíssima folhagem. O contraste do caule alaranjado, que se revela a partir do centro da planta, entre as vistosas folhas verdes onduladas, conferiu à planta o nome popular pelo qual este clorofito é chamado aqui no Brasil.

A lumina é uma planta bastante resistente, que requer muito pouca manutenção. Seu cultivo é bem tranquilo, de modo que a planta lumina é uma opção ideal para os jardineiros de apartamento. Embora seja uma espécie de origem tropical, o Chlorophytum orchidastrum não gosta do sol pleno, situação que pode causar danos e queimaduras às suas folhas. O ideal é que a lumina seja mantida em um lugar com bastante luminosidade indireta, próxima a uma janela, protegida da incidência direta dos raios solares.
",
  price: 56,
  pet_friendly: true,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 35 cm",
  best_seller: false,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: frequencia_media
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1615408360/nufiu/we7lhorssbyx6cykt7n6i5emv372.png"
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
  price: 52,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sombra,
  water_period: raramente
  )
  
url = "https://res.cloudinary.com/gustborges/image/upload/v1617817308/nufiu/Screen_Shot_2021-03-10_at_17.44.40_nbtgk2.png"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
jiboia.photo.attach(io: file, filename: filename)
jiboia.save!

espada = Plant.create!(
  name: "Espada de São Jorge",
  scientific_name: "Epipremnum pinnatum",
  description: "Ligada por muitos ao místico, a espada de São Jorge é uma planta lindíssima e que está super em alta. É conhecida por ser uma das melhores espécies de plantas com ação purificadora para os ambientes e energias. Suas propriedades permitem que ela absorva substâncias tóxicas do ar durante o dia, enquanto à noite libera oxigênio limpo. Esse efeito auxilia na purificação dos cômodos da casa.

A Espada de São Jorge exige poucos cuidados. Não precisa de muita adubação, se adapta bem tanto ao Sol, quanto à sombra e não precisa de muita rega. Ou seja, é ideal para quem quer uma planta em casa, mas sem ter muito trabalho. É uma planta bastante resistente e que sobrevive em áreas rnas com sol e também em áreas internas com menos incidência de luz e vento.

",
  price: 48,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sol,
  water_period: frequencia_media
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1617817308/nufiu/Screen_Shot_2021-03-10_at_17.45.12_k05bto.png"
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
  price: 60,
  pet_friendly: false,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 35 cm",
  best_seller: false,
  user: borgesmalu,
  category: kokedama,
  sun: meia_sombra,
  water_period: todo_dia
  )
  url = "https://res.cloudinary.com/gustborges/image/upload/v1615409006/nufiu/iegp8ec407hjtgh0tiexczdh3at6.png"
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
  price: 103,
  pet_friendly: true,
  water_text: "Rega a cada 1-2 semanas",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama,
  sun: sombra,
  water_period: todo_dia
  )

url = "https://res.cloudinary.com/gustborges/image/upload/v1615408945/nufiu/3msh6ih103srqgwn7atr19cqtm78.png"
filename = File.basename(URI.parse(url).path)
file = URI.open(url)
pacova.photo.attach(io: file, filename: filename)
pacova.save!
puts 'All done!'

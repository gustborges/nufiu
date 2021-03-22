# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Plant.destroy_all
User.destroy_all
puts 'Last seeds destroyed'


puts 'Seeding users'

borgesmalu = User.create!(
  name: "Maria Luiza Borges",
  email: "borges.malu@gmail.com",
  password: "nni6mug8",
  phone: "(21)993444535",
  address: "R. Vice Gov. Rubens Berardo, 65 - Bloco 2 - apt 307",
  admin: true
  )


gustavoborges = User.create!(
  name: "Gustavo Borges",
  email: "gustborges@gmail.com",
  password: "nni7mug9",
  phone: "(21)967808889",
  address: "R. Almirante Alexandrino, 1310 - apt 201",
  admin: true
  )

cliente = User.create!(
  name: "Max Lima",
  email: "maxlimascm@gmail.com",
  password: "raguzinho",
  phone: "(21)98312099021",
  address: "Santa Teresa",
  admin: false
  )

puts 'Seeding categories'

kokedama = Category.create!(
  name: "Kokedama"
  )

pote = Category.create!(
  name: "Pote"
  )

puts 'Seeding plants'

costela_de_adao = Plant.create!(
  name: "Costela de Adão",
  scientific_name: "Monstera deliciosa",
  description: "Essa planta tem uma folhagem muito exuberante, de linhas orgânicas bem características, cheias de recortes. O melhor é que ela se adapta muito bem a ambientes internos.
De uma maneira geral, plantas de cor verde bem escuro se desenvolvem bem à meia sombra; por isso, são perfeitas para quem mora em apartamento onde não bate tanto sol direto
",
  price: 40,
  pet_friendly: false,
  water: "Rega frequente",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama
  )


lumina = Plant.create!(
  name: "Lumina",
  scientific_name: "Chlorophytum orchidastrum",
  description: "O destaque da Lumina fica, sem dúvida, por conta de sua belíssima folhagem. O contraste do caule alaranjado, que se revela a partir do centro da planta, entre as vistosas folhas verdes onduladas, conferiu à planta o nome popular pelo qual este clorofito é chamado aqui no Brasil.

A lumina é uma planta bastante resistente, que requer muito pouca manutenção. Seu cultivo é bem tranquilo, de modo que a planta lumina é uma opção ideal para os jardineiros de apartamento. Embora seja uma espécie de origem tropical, o Chlorophytum orchidastrum não gosta do sol pleno, situação que pode causar danos e queimaduras às suas folhas. O ideal é que a lumina seja mantida em um lugar com bastante luminosidade indireta, próxima a uma janela, protegida da incidência direta dos raios solares.
",
  price: 25.50,
  pet_friendly: true,
  water: "Rega moderada",
  size: "Altura média de 35 cm",
  best_seller: false,
  user: borgesmalu,
  category: kokedama
  )


jiboia = Plant.create!(
  name: "Jiboia",
  scientific_name: "Epipremnum pinnatum",
  description: "A jiboia é extremamente adaptável ao ambiente que está sendo cultivada. Em vasos e cachepôs, a planta se mantém pequena e reservada; quando suspensa, deixa seus caules e folhas pendentes, criando uma espécie de cortina verde super charmosa — alternativa perfeita para decorar qualquer espaço.

Sua folhagem se adapta bem aos ambientes com sombra, mas cresce melhor e mais rápido em locais com luz indireta. A única coisa que ela não suporta são as baixas temperaturas!

Em estações quentes e secas, como a primavera e o verão, as regas devem ser feitas de duas a três vezes por semana. Já no outono e no inverno, quando o ar está mais frio e úmido, é preciso diminuir a frequência da irrigação: uma a duas vezes por semana é o suficiente.
",
  price: 23,
  pet_friendly: false,
  water: "Rega moderada",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama
  )


espada = Plant.create!(
  name: "Espada de São Jorge",
  scientific_name: "Epipremnum pinnatum",
  description: "Ligada por muitos ao místico, a espada de São Jorge é uma planta lindíssima e que está super em alta. É conhecida por ser uma das melhores espécies de plantas com ação purificadora para os ambientes e energias. Suas propriedades permitem que ela absorva substâncias tóxicas do ar durante o dia, enquanto à noite libera oxigênio limpo. Esse efeito auxilia na purificação dos cômodos da casa.

A Espada de São Jorge exige poucos cuidados. Não precisa de muita adubação, se adapta bem tanto ao Sol, quanto à sombra e não precisa de muita rega. Ou seja, é ideal para quem quer uma planta em casa, mas sem ter muito trabalho. É uma planta bastante resistente e que sobrevive em áreas rnas com sol e também em áreas internas com menos incidência de luz e vento.

",
  price: 30,
  pet_friendly: false,
  water: "Rega moderada",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama
  )


comigo_ninguem_pode = Plant.create!(
  name: "Comigo ninguém pode",
  scientific_name: "Dieffenbachia seguine",
  description: "Essa planta tóxica da família Araceae possui folhas vistosas com manchas esbranquiçadas características, frutos na forma de baga e flores em espádice. Originária da Amazônia, essa herbácea tem vastas possibilidades de usos – desde decoração até eliminação de pragas e insetos.

Diferentemente de grande parte das plantas para cultivo doméstico, não é recomendado que essa planta seja exposta diretamente ao sol durante todo o tempo, de modo que é melhor que ela esteja em áreas onde há abundância de sombra durante a movimentação do sol.
É importante frisar que, apesar de bastante bonitas, algumas plantas ornamentais possuem grande potencial para provocar acidentes graves, como é o caso da comigo-ninguém-pode. Assim sendo, antes de adquirir qualquer produto, é importante avaliar os riscos e quem poderá ter acesso a essas plantas.
",
  price: 36.50,
  pet_friendly: false,
  water: "Rega moderada",
  size: "Altura média de 35 cm",
  best_seller: false,
  user: borgesmalu,
  category: kokedama
  )

pacova = Plant.create!(
  name: "Pacová",
  scientific_name: "Philodendron martianum",
  description: "Dono de folhas de um verde intenso e brilhante, o Pacová é uma espécie nativa do Brasil, encontrada aos montes em regiões cobertas pela Mata Atlântica (SP, RJ e no PR). Como seu ambiente nativo tem clima quente e úmido, o pacová não é muito fã de baixas temperaturas.

Recomendamos cultivá-lo em áreas de luz indireta, ou à meia-sombra – com incidência de sol ameno do início ou fim do dia. Gosta de rega moderada, em geral 1 vez por semana é suficiente. Apesar de ser uma espécie tropical, é preciso sempre observar como ela reage à luminosidade.

",
  price: 62,
  pet_friendly: true,
  water: "Rega moderada",
  size: "Altura média de 35 cm",
  best_seller: true,
  user: borgesmalu,
  category: kokedama
  )



puts 'All done!'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# La siguiente línea limpia la base de datos y reinicia los índices.
# ActiveRecord::Base.connection.execute('TRUNCATE users, artistas_presentaciones, obras_presentaciones, presentaciones, conciertos, artistas_visibles, artistas, obras, encuentros RESTART IDENTITY')
# ActiveRecord::Base.connection.truncate(:users, :presentaciones, :artistas)

unless User.any?
  User.create(name: 'Administrador', email: 'flauteandoenelrio@gmail.com', password: 'admin')
end

unless Encuentro.any?
  enc = Encuentro.create(
    version: 2019,
    epigrafe: 'VII Encuentro Internacional de Flauta Traversa',
    titulo: 'Flauteando en el Río 2019',
    bajada: 'Conservatorio de Música UACh',
    vision: 'El Encuentro Internacional de Flauta Traversa “Flauteando en el Río” nace el año 2013 en el Conservatorio de Música de la Facultad de Arquitectura y Artes de la Universidad Austral de Chile (UACh), siendo coordinado y dirigido por la docente del Conservatorio de Música a cargo de la cátedra de flauta traversa, Mg. Florángel Mesko Oberg. La idea de este evento nace como una consecuencia del alto interés que ha generado la enseñanza de este instrumento a nivel regional y nacional. El encuentro se ha transformado en una valiosa experiencia para estudiantes y artistas invitados, ya que genera instancias para compartir y participar en actividades formativas tradicionales como clases individuales y colectivas, y en actividades prácticas que involucran la conformación de ensambles y una orquesta de flautas de estudiantes, a cargo de Mg. Jorge Valdebenito Bertuzi (coordinador musical del encuentro), además de la realización de conciertos. Dentro de las actividades que se realizan en este encuentro se contempla la presentación de estudiantes, académicos y también de invitados nacionales e internacionales donde se ofrece una agenda variada de actividades, de corte formativo-práctico, impartidas por reconocidos intérpretes.',
    mision: 'Flauteando en el río es una actividad de carácter formativo sin costo de inscripción que tiene por objetivos enriquecer y fortalecer el conocimiento y la práctica de la flauta traversa en distintas áreas, desarrollar técnicas básicas, intermedias y avanzadas en el estudio de la flauta traversa, crear un ambiente de intercambio y aprendizaje entre estudiantes y profesores asistentes al encuentro fomentando la empatía, el trabajo en equipo y el respeto a la diversidad brindando experiencias enriquecedoras a todas las personas que participan.',
    habilitado: true,
  )
end

unless Artista.any?
  art_fmo = Artista.create(
    nombre: 'Florángel Mesko Oberg',
    bio: 'Comienza sus estudios de flauta traversa en Santiago con el maestro Alberto Almarza. Mas tarde realiza sus estudios formales de  flauta traversa en la Facultad de Artes de la Universidad de Chile obteniendo el Grado Académico de Licenciatura en Artes con mención en flauta Traversa y en el Instituto Profesional Escuela Moderna de Música con el maestro Hernán Jara, donde obtien el título de Intérprete Musical Superior en Flauta Traversa. El año 2001 es becada para  realizar estudios de perfeccionamiento, nivel Master, en flauta traversa en la VSMU, Bratislava (Eslovaquia) bajo el alero del maestro Tomás Janosik. Ha participado en cursos de perfeccionamiento  en flauta traversa en Chile y en el extranjero con diversos flautistas de renombre internacional. Su experiencia en orquesta ha sido con la Orquesta Sinfónica Nacional Juvenil, Orquesta Sinfónica de Chile, Orquesta Universidad de Santiago, entre otras. Se ha presentado como solista con Orquesta y con diversas agrupaciones de música de cámara y folklóricas viajando por Chile y el extranjero. Ha participado en distintos proyectos de música Latinoamericana, Folklor y Docta de todos los períodos participando en estrenos y grabaciones de diversos formatos. Ha sido invitada a participar como flautista y docente en diversos festivales de Flauta Traversa. Tanto como flauta sola y en música de cámara trabaja con distintas agrupaciones realzando las posibilidades que tiene la flauta traversa en diferentes estilos y formatos realizando estrenos, así como dando a conocer la literatura para este instrumento, con especial enfasis en “Sauko, música y memoria”, agrupación que profundiza en la búsqueda de diferentes identidades sonoras. Diplomada en Neurociencias y Master en Musicoterapia.

    Actualmente es docente de la Universidad Austral de Chile donde tiene a cargo la mención de flauta traversa, realiza clases de música de cámara, es Docente del Diplomado de Arte terapia y donde organiza y coordina el Encuentro Internacional de Flautaa Traversa , “Flauteando en el río”, iniciativa encargada de promover y estimular la practica de la flauta traversa.',
  )

  art_jvb = Artista.create(
    nombre: 'Jorge Valdebenito Bertuzi',
    bio: 'Comienza los estudios de flauta traversa en su ciudad natal, Concepción. Mas tarde se radica en Santiago donde inicia los estudios formales de  flauta traversa en la Facultad de Artes de la Universidad de Chile donde obtiene el Grado Académico de Licenciatura en Artes con mención en flauta traversa y el título de Intérprete en Flauta Traversa, posteriormente estudia  en el Instituto Profesional Escuela Moderna de Música  con el maestro Hernán Jara, obteniendo el título de Intérprete Superior en Flauta Traversa. Realiza el Magister de Gestión y Administración de recursos culturales en la Universidad de Chile. El año 2001 es becado para realizar estudios de perfeccionamiento , nivel master, en flauta traversa en la VSMU, Bratislava (Eslovaquia) bajo el alero del maestro Tomás Janosik. Ha participado en cursos de perfeccionamiento tanto en flauta traversa como en dirección de orquesta en Chile y el extranjero con diversos flautistas y directores de renombre internacional. Fue Flauta Solista y Director de la Banda Sinfónica de la Fuerza Aérea de Chile realizando estrenos de obras para flauta y banda. Su experiencia en orquesta ha sido con la Orquesta Sinfónica de Chile, Orquesta Filarmónica, entre otras. Se ha presentado como solista con Orquesta y con diversas agrupaciones de música de cámara y folklóricas viajando por Chile y el extranjero. Ha sido invitado a participar como flautista, docente y técnico en diversos festivales de Flauta Traversa. Es técnico autorizado Straubinger y Diplomado en Neurociencias. Fue profesor titular de flauta traversa en la Universidad de Talca así como ha impartido clases en la Universidad de Chile, Universidad San Sebastian sede Valdivia y Universidad Austral de Chile. En música de cámara trabaja con distintas agrupaciones realizando estrenos y composiciones propias con especial enfasis en “Sauko, música y memoria”, agrupación que profundiza en la búsqueda de diferentes identidades sonoras. Como director ha trabajado con diferentes formatos de orquesta y estilos musicales.

    Actualmente es docente en el Instituto Alemán Carlos Andwanter, Profesor del Colegio J. S. Bach y María Auxiliadora, Director de la Orquesta DAE de la Universidad Austral de Chile, coordinador musical y director de los ensambles y orquesta de flautas del Encuentro Internacional “Flauteando en el río”,que se realiza cada año en el Conservatorio de Música de la Universidad Austral de Chile.

    Magister en “Interpretación de Música Latinoamericana del siglo XX y XXI”, (en proceso) Universidad de Cuyo, Mendoza.',
  )

  art_fhs = Artista.create(
    nombre: 'Fernando Harms Saa',
    bio: 'Músico, Flauta traversa.  Nacido en Santiago de Chile en año 1943. Estudia flauta traversa en el Conservatorio Nacional de Música de Santiago de Chile y en la Universidad Católica de Chile. Su experiencia en orquesta comienza siendo solista de la Orquesta Sinfónica de Concepción, posteriormente ocupó el puesto de solista de la Orquesta Filarmónica del Teatro Municipal de Santiago. En 1974 y 75 fue suplente de solista de la Orquesta filarmónica de Rostock, Alemania. Desde 1977 hasta 1995 ocupó el cargo de solista en la Orquesta Filarmónica del Teatro Municipal de Santiago. Junto al Quinteto de vientos Hindemith realiza una labor profesional completa, con destacadas actuaciones en festivales de música contemporánea. Los conciertos ofrecidos por este grupo abarcaron presentaciones educacionales en Santiago, y en numerosas giras nacionales e internacionales, actuaciones en temporadas oficiales internacionales, centros culturales y universitarios, canales de TV, llegando a superar más de doscientas actuaciones en sus dos años de maxima actividad. Ha actuado como solista junto a la Orquesta Filarmónica de Chile en las temporadas de 1971-72-81, la Orquesta de Cámara de la U. Católica de Chile 1972, Orquesta Sinfónica de Chile estrenando el concierto André Jolivet para flauta y dieciséis instrumentos de percusion. Fernando Harms, a lo largo de su carrera profesional, ha realizado una variada labor de difusión con recitales en centros universitarios, culturales y salas de concierto en Santiago y otras capitales de Chile; La Paz, Bolivia; Lima Perú.

    Investigación y construcción de flautas

    En 2001 empezó un intenso trabajo de investigación sobre la construcción de flautas. En la Convención de Flautas de U.S.A. 2002, vendió las primeras cabezas. El año 2003 comenzó la construcción experimental de la primera flauta completa. Hasta la fecha ha construído seis flautas completas y ha participado como expositor de flautas en la Convención de Flautistas de U.S.A. 2002; en el Festival de Flautas de Lima, Perú, en el año 2006; en el Festival de Flautas del Mundo de Mendoza, Rep. Argentina en el año 2009 y 2011 y en el Festival de Flautistas de España en Barcelona 2012.',
  )

  art_he = Artista.create(
    nombre: 'Hans Ehrlich',
    bio: 'Comenzó a estudiar flauta traversa en la escuela artística Violeta Parra. Luego se traslada a la ciudad de Santiago para continuar sus estudios de forma profesional en la Universidad de Chile. Mas tarde conoció en clases magistrales al maestro Gabriel Goñi de Costa Rica, Flautista y técnico de flautas. En el año 2006 al 2008 fue invitado por la empresa Yamaha para participar de los seminarios latinoamericanos de técnicos en vientos realizados en Chile y Argentina, obteniendo certificación para trabajar de forma certificada en su propio taller En el 2010 y 2011 es invitado al encuentro de flautas del sur del mundo organizado por el reconocido primer flautista de la sinfónica de Chile Hernan Jara quien invita a Hans a ser parte del encuentro como técnico activo hasta la actualidad. Fue en este Encuentro donde conoce a Catherine Miller, presidenta de las marcas Miyazawa, Sankyo y Trevor James donde es invitado a entrenarse en el en la Ciudad de Coralville Iowa. Desde el año 2013 a la fecha Hans se a certificado con marcas de flautas y repuestos como straubinger, Miyazawa, Sankyo, Trevor James, Brannen, Muramatsu, Nagahara y Haynes.',
  )

  art_amf = Artista.create(
    nombre: 'Adolfo Muñoz Flores',
    bio: 'Inicia estudios de Flauta en el Conservatorio de la Universidad de Talca y luego estudia en la Facultad de Artes de la Universidad de Chile. Como técnico estudia en EEUU con Jonathon Landell. Ha tomado clases magistrales de flauta traversa con renombrados flautistas de Chile y el Extranjero. En el año 2013 inicia sus estudios de reparación en Oboes, con Paulo Barreto, certificándose como Técnico autorizado de Oboes Marigaux con Jean Marc Joarquin. Ha sido certificado por Landell Flutes, Straubinger y Verne Q Powell Flutes en Boston, EEUU, donde se certifica como técnico Powell para Latinoamérica. Desde el año 2013 a la actualidad es invitado a participar como Técnico al Encuentro de Flautas ‘’Flauteando en el Rio’’ Organizado por el Conservatorio de la UACh en la ciudad de Valdivia. Desde el año 2015 a la fecha es invitado como Docente y técnico del Encuentro de Flautistas Al pie del Misti, Arequipa, Perú. Este año, 2016 hace pública su marca de flautas AM Flutes así como también representa y distribuye Piper Flutes, Dean Yang, Di Zhao, Bernhard Hammig, Guo y accesorios BG France.',
  )

  art_rp = Artista.create(
    nombre: 'Raul Pimentel',
    bio: 'Nace en Agosto de 1992, en San Juan de los Morros - Venezuela, hijo de Daly Meza (Violinista) y Raúl Pimentel (Flautista), Raúl inicia sus estudios musicales en el año 2005 en la Orquesta Jesús  María Torrealba en la cátedra de flauta dulce con el profesor Leonardo Hurtado, ingresa a la cátedra de flauta transversa bajo la tutela del Prof. Raúl Pimentel (Padre) y lenguaje musical con el Prof. Pedro Miguel Alayón. En el 2007 ingresa por medio de audiciones realizadas a nivel nacional a la Orquesta Infantil de Venezuela donde se desempeñó como primera flauta y contó con la dicha de ser dirigido por grandes maestros como Gustavo Dudamel, Simon Rattle, entre otros. Ha participado en diversos encuentros a nivel nacional como el “II Seminario de flautas” realizado en la ciudad de Caracas con destacados músicos como José Antonio Naranjo, Marcos Granados y el maestro Pedro Eustache, ha recibido clases magistrales con la profesora rumana Otilia Panaitesco en la sede de la Universidad Nacional Experimental de las Artes, también con losmaestros Peter Lucas Graf, Hernán Jara, Lars Nilson y el piccolista Jean Louis Beaumadier, bajo el marco del primer Festival de Vientos Madera de Venezuela en el año 2007. Por tres años consecutivos a participado en el Festival Unión de las Artes el cual se realiza en Guama estado Yaracuy con los maestros Antonio Naranjo, María Gabriela Rodríguez y el maestro Michel Bellavance. En el año 2008 participa en el 2do Encuentro Internacional de Flautas realizado en la ciudad de Caracas donde recibe clases con los maestros Pedro Eustache, Alexandra Still, Sandrine Tilli y Peter Lukas Graf. En el año 2009 participó en diversos recitales realizados en el Centro de Acción Social por la Música dentro de la Academia Latinoamericana de Flautas y formó parte de lossolistas seleccionados para la apertura de la Academia Latinoamericana de Piccolo, donde ofreció un concierto, acompañado por la Orquesta de la Juventud Venezolana “Simón Bolívar” bajo la dirección del maestro Raimundo Pineda. Ha realizado diversos conciertos como solista acompañado por varias orquestas del país. En abril de 2010 fue finalista del “II Concurso Nacional de Flauta y Piccolo de Jóvenes Solistas Yamaha 2010”. En 2011 obtuvo el 1er Premio en la categoría Piccolo en el Concurso del Festival Internacional de Flauta y Piccolo realizado en la ciudad de Caracas, en este recibió clases magistrales con los maestros Philippe Bernold, Jean Louis Beaumadier y Davide Formisano y participó como solista en un concierto junto a la Orquesta Sinfónica de la Juventud Venezolana “Simon Bolívar”, en octubre de este mismo año obtuvo el 1er Premio en la categoría Piccolo del “III Concurso Nacional de Flauta y Piccolo de Jóvenes Solistas Yamaha 2011”. Se desempeñó como principal de flauta de la Orquesta de la Juventud Guariqueña “Antonio Estévez”, también como principal de flauta de la Orquesta Sinfónica del Estado Guárico. En el año 2012 realizó el estreno en Venezuela del Concierto para piccolo y orquesta del compositor armenio Jeff Manookian junto a la Orquesta sinfónica Simón Bolívar de Venezuela bajo la dirección de Jesús Morin. Ese mismo año se traslada a la ciudad de Caracas para integrar la fila de flauta de la Orquesta Sinfónica Juvenil de Caracas, como asistente al principal, bajo la tutela del maestro Dietrich Paredes con la cual realizó distintos tours presentándose en prestigiosos escenarios de Europa y Asia, en el año 2012 por Portugal y Oslo, en las salas Gulbenkian Foundation, Grande Auditorio en Lisboa, Casa da Musica en Oporto y en Oslo, en Oslo Konserthus. En octubre de ese mismo año en Rusia en Mariinsky Concert Hall de St. Petersburg; Republica Checa en Rudolfinum en Praga; Belgica en De Bijloke Concert Hall en Ghent; Ausria en el Konzerthaus de Vienna y Alemania en Beethovenhalle en Bonn. En el año 2013 en Austria en Felsenreitschule en el marco del Salzburg Festival. Ese mismo año realiza tour por Asia presentándose en Japón en Hiroshima-shi Koryu Kaikan; Tokyo Metropolitan Art Space de Tokyo, Chibaken Bunka Kaikan, Korea en Seoul Arts Centre y Duksugung Kyung Bok. En el año 2014 por Suiza en el Tonhalle de Zurich; Alemania Laeiszhalle de Hamburgo; Francia en Cité de la Musique en Paris; Croacia en Vatroslav Lisinski Concert Hall de Zagreb; Hungria en Liszt Akademia de Budapest, Austria en Musikverein de Vienna y Suecia en Konzerthuset de Gotemburgo, En 2014 obtuvo el Primer premio del concurso de la Orquesta Nacional de Flauta en homenaje al maestro “Ángel Briceño” en la categoría Piccolo, ese mismo año participó como solista junto a la Orquesta Sinfónica de Venezuela bajo la dirección de Daniel Gil. En el año 2015 en Italia el Teatro alla Scala en Milan, en el marco de la EXPO Milano 2015. En ese mismo año en Portugal en Gulbenkian Foundation, Grande Auditorio de Lisboa; Francia en L’Auditorium de Bordeaux; Halle aux Grains en Toulouse; España en el Palau de la Musica Catalana en Barcelona; Auditori i Palau de Congressos de Castelló, Catellón de la Plana y el Auditorio de Zaragoza. En el año 2016 gana el primer puesto como Flauta solista en Sinfónica de Caracas.  Y  desde Abril  de 2017 se desempeña como director de Sinfonía Por el Perú Nucleo Arequipa.',
  )

  art_mjc = Artista.create(
    nombre: 'María José Carrasqueira',
    bio: 'Intérprete brasileña de renombre, llamada “musicienne dans l’âme”, desarrolla una intensa carrera como solista, música de cámara y ponente, actuando en América Latina, Estados Unidos, Escandinavia, Europa, Armenia y Nueva Zelanda.

    “Maria José Carrasqueira nos cautivó por sus incontables dotes… intérprete con una excelente técnica y gran sensibilidad… y con un profundo sentido de la estética…“ (Momento Sera – Roma)

    Su CD con obras de E. Nazareth editado en Europa por el sello Solstice e YB, en Brasil, fue clasificado con 4 estrellas por las revistas “Le Monde de la Musique” y “Diapason” de París, siendo aclamado con unanimidad en Brasil.

    “…este sabroso récord merece atención. María José Carrasqueira habla su lengua materna aquí y siempre encuentra el ritmo y el tono exactos. Sin precipitaciones, sino un aliento natural, un encanto inmediato que te conquista. Con el borde del sentimentalismo requerido en los acordes más delicados ... y un estilo que no sacrifica nada al exterior en páginas más animadas, el intérprete muestra mucha precisión en la caracterización…” (Diapason - Alain Cochard - Paris)

    “… su precioso credo artístico es el responsable por este CD que ejerce de auténtica divisoria de aguas en la interpretación de la obra de E. Nazareth…” (O Estado de São Paulo- J.Marcos Coelho)

    “…y María José Carrasqueira interpreta estas obras con tacto, dándoles una expresión justa, mediante un juego siempre “natural" que combina perfectamente las fluctuaciones del habla y una hermosa paleta de sonidos...” (CD-“Nazareth” -  Hebdo National – H.B. – Paris)

    Doctora en Artes, entusiasta organizadora de eventos y producciones musicales relevantes, es la creadora y productora de la “Serie Regia Música” – sello Paulinas/ Comep. Premio Carlos Gomes – Solista Instrumental, Premio de la Asociación Paulista de Críticos de Arte – Mejor Solista; Premio Sharp de Música – Mejor CD de Música Clásica – Producción.

    Como investigadora, es la responsable por las ediciones de los álbumes “O Melhor de Pixinguinha” y “O Livro de Pattápio Silva”, (Ed. Irmãos Vitale), además de la revisión crítica de los “Vinte Estudos para Piano” de Camargo Guarnieri. Ha realizado inúmeras actuaciones y grabaciones para la radio y la televisión y es poseedora de una exitosa discografía.

    En sus frecuentes presentaciones en Estados Unidos se puede destacar el recital en el Weil Hall del Carnegie Hall a dúo con su hermano, el flautista brasileño Toninho Carrasqueira.

    Solista junto a importantes orquestas brasileñas e internacionales, ha sido la primera artista brasileña a presentarse con la Armenian Philarmonic Orchestra, en Yerevanm bajo la dirección de Ruben Asatryan.

    Nacida en el seno de una familia de artistas, en el que la música, la pintura y la literatura eran parte de su vida cotidiana, Maria José Carrasqueira pudo convivir desde su más tierna infancia con el universo libre y democrático del arte, en el cual no había barreras para experimentar lo popular y lo erudito y los clásicos dialogaban siempre con los lenguajes más contemporáneos. Por su casa paterna pasaron muchos de los más importantes personajes de la historia de la música brasileña del siglo XX. La posibilidad de convivir con las personalidades que más han contribuido para exaltar el arte musical brasileño, hizo que la difusión de la música de Brasil fuera su bandera para esta artista, una de las más expresivas ‘intérpretes-representantes’ de la música de su país.

    Realizó sus estudios es Brasil y en Europa con, además de su padre, João Dias Carrasqueira, Lina Pires de Campos, Camargo Guarnieri, J. Klein, Magda Tagliaferro, B. Seidlhoffer, E. Richepin, H. Datyner, D. Rossiaud e G. Demus.

    Su discografía se encuentra en los sellos Paulinas/Comep; SESC; YB (Brasil); Solstice (Francia); Odyssey Discs (USA); Eskarbó (Francia); Centaur Records (USA).

    “… La Fusión expresiva realizada por los dos hermanos instrumentistas está entre las mejores presentadas en Roma en esta temporada…” (Nuovo Sound – Roma)

    “… Maria José es una excelente música… nos lo demostraría al tocar Guarnieri… en una ejecución auténtica de bella cualidad… y en la sonata de Kabalevsky que convierte en una fiesta.” (Le Dauphine Libere – Annecy - Françia)',
  )

  art_sp = Artista.create(nombre: 'Salvador Pradenas')
  art_fg = Artista.create(nombre: 'Felipe García')
  art_jt = Artista.create(nombre: 'Juan Torres')
  art_av = Artista.create(nombre: 'Arturo Valdés')
  art_jpm = Artista.create(nombre: 'Juan Pablo Moyano')
  art_fm = Artista.create(nombre: 'Felipe Méndez')
  art_cr = Artista.create(nombre: 'Carlos Rojas')
  art_fl = Artista.create(nombre: 'Florencia López')
  art_vs = Artista.create(nombre: 'Victoria Salazar')
end

unless Concierto.any?
  conc_1 = Concierto.create(encuentro: enc, fecha: '2019-10-08', hora: '19:30', lugar: 'Casona Cultural Amigos de Panguipulli')
  conc_2 = Concierto.create(encuentro: enc, fecha: '2019-10-09', hora: '19:30', lugar: 'Sala Sergio Pineda / Conservatorio de Música UACh')
  conc_3 = Concierto.create(encuentro: enc, fecha: '2019-10-10', hora: '12:00', lugar: 'Sala Sergio Pineda / Conservatorio de Música UACh')
  conc_4 = Concierto.create(encuentro: enc, fecha: '2019-10-10', hora: '19:30', lugar: 'Sala Sergio Pineda / Conservatorio de Música UACh')
end

unless Presentacion.any?
  # 2019-10-08
  pres_1 = Presentacion.create(concierto: conc_1, orden: 1)
  pres_2 = Presentacion.create(concierto: conc_1, orden: 2)
  pres_3 = Presentacion.create(concierto: conc_1, orden: 3)
  pres_4 = Presentacion.create(concierto: conc_1, orden: 4)
  pres_5 = Presentacion.create(concierto: conc_1, orden: 5)

  # 2019-10-09
  pres_6 = Presentacion.create(concierto: conc_2, orden: 1)
  pres_7 = Presentacion.create(concierto: conc_2, orden: 2)
  pres_8 = Presentacion.create(concierto: conc_2, orden: 3)
  pres_9 = Presentacion.create(concierto: conc_2, orden: 4)

  # 2019-10-11 12:00
  pres_10 = Presentacion.create(concierto: conc_3, orden: 1)
  pres_11 = Presentacion.create(concierto: conc_3, orden: 2)
  pres_12 = Presentacion.create(concierto: conc_3, orden: 3)

  # 2019-10-11 19:30
  pres_13 = Presentacion.create(concierto: conc_4, orden: 1)
  pres_14 = Presentacion.create(concierto: conc_4, orden: 2)
  pres_15 = Presentacion.create(concierto: conc_4, orden: 3)
end

unless Obra.any?
  obra_1 = Obra.create(titulo: 'Hora staccato', compositor: 'Grigoras Dinicu (Rumania, 1889 – 1949)')
  obra_2 = Obra.create(titulo: 'Suite para flauta y piano op. 34 (Moderato – Scherzo – Romance – Final)', compositor: 'Charles Maria Widor (Francia, 1844 – 1937)')
  obra_3 = Obra.create(titulo: 'Vladimir Tsybin (Rusia, 1877 – 1949)', compositor: 'Vladimir Tsybin (Rusia, 1877 – 1949)')
  obra_4 = Obra.create(titulo: 'Philippe Gaubert (Francia, 1879 – 1941)', compositor: 'Philippe Gaubert (Francia, 1879 – 1941)')
  obra_5 = Obra.create(titulo: 'Fantasía Andina', compositor: 'César Vivanco (Perú, 1949 - )')
  obra_6 = Obra.create(titulo: 'Tango – Habanera - Yaraví y Huayno – Cachimbo – Zamba – Valse – Sanjuanito – Takirari - Son Jarocho – Choro', compositor: 'Sergio Arriagada ( Chile, 1945 – Francia, 2019)')
  obra_7 = Obra.create(titulo: 'Sonatina para flauta y piano', compositor: 'Camargo Guarnieri (Brasil, 1907 – 1993)')
  obra_8 = Obra.create(titulo: 'Variaciones imposibles para flauta sola', compositor: 'Paul Desenne (Venezuela, 1959 - )')
  obra_9 = Obra.create(titulo: 'Dúo concertante, Op. 149 Nº1 (Cadenza – Ciaccona – Rondó)', compositor: 'Blas Atheortúa (Colombia, 1943 - )')
  obra_10 = Obra.create(titulo: 'Concerto Allegro Nº2 for Flute and Piano', compositor: 'Vladimir Tsybin (Rusia, 1877 – 1949)')
  obra_11 = Obra.create(titulo: 'Nocturne et allegro scherzando', compositor: 'Philippe Gaubert (Francia, 1879 – 1941)')
  obra_12 = Obra.create(titulo: 'Suite inglesa Nº4, op.82 (Allegro non tropo – Adagio cantando – Presto, non les than - Giocoso)', compositor: 'John Duarte (Inglaterra, 1919 – 2004)')
  obra_13 = Obra.create(titulo: 'Sonata en Trio para tres flautas traversas en Rem Op. VII Nº4 (Doucement – Courante – Allemande – Premier et Deuxième Menuet)', compositor: 'Joseph Bodin de Boismortier (Francia, 1689 – 1755)')
  obra_14 = Obra.create(titulo: 'Flute Trio en Sol m Op. 13 Nº2 (Allegro non tanto – Allegro con moto)', compositor: 'Friedrich Kuhlau  (Alemania, 1786 – 1832)')
  obra_15 = Obra.create(titulo: 'Duettino sobre motivos húngaros, op.36', compositor: 'Franz Doppler (Ucrania, 1821 – Austria, 1883)')
  obra_16 = Obra.create(titulo: 'Valse – Sanjuanito – Takirari - Son Jarocho – Choro', compositor: 'Sergio Arriagada (Chile, 1945 – Francia, 2019)')
end

unless ArtistaPresentacion.any?
  # 2019-10-08
  ArtistaPresentacion.create(artista: art_fmo, presentacion: pres_1)
  ArtistaPresentacion.create(artista: art_jvb, presentacion: pres_1)
  ArtistaPresentacion.create(artista: art_sp, presentacion: pres_2)
  ArtistaPresentacion.create(artista: art_rp, presentacion: pres_3)
  ArtistaPresentacion.create(artista: art_fhs, presentacion: pres_4)
  ArtistaPresentacion.create(artista: art_fg, presentacion: pres_5)

  # 2019-10-09
  ArtistaPresentacion.create(artista: art_fmo, presentacion: pres_6)
  ArtistaPresentacion.create(artista: art_jvb, presentacion: pres_6)
  ArtistaPresentacion.create(artista: art_rp, presentacion: pres_7)
  ArtistaPresentacion.create(artista: art_fhs, presentacion: pres_8)
  ArtistaPresentacion.create(artista: art_fg, presentacion: pres_9)

  # 2019-10-11 12:00
  ArtistaPresentacion.create(artista: art_jt, presentacion: pres_10)
  ArtistaPresentacion.create(artista: art_av, presentacion: pres_10)
  ArtistaPresentacion.create(artista: art_jpm, presentacion: pres_11)
  ArtistaPresentacion.create(artista: art_fm, presentacion: pres_11)
  ArtistaPresentacion.create(artista: art_cr, presentacion: pres_11)
  ArtistaPresentacion.create(artista: art_fl, presentacion: pres_12)
  ArtistaPresentacion.create(artista: art_vs, presentacion: pres_12)

  # 2019-10-11 19:30
  ArtistaPresentacion.create(artista: art_rp, presentacion: pres_13)
  ArtistaPresentacion.create(artista: art_fhs, presentacion: pres_14)
  ArtistaPresentacion.create(artista: art_fg, presentacion: pres_15)
end

unless ObraPresentacion.any?
  # 2019-10-08
  ObraPresentacion.create(obra: obra_1, presentacion: pres_1)
  ObraPresentacion.create(obra: obra_2, presentacion: pres_2)
  ObraPresentacion.create(obra: obra_3, presentacion: pres_3)
  ObraPresentacion.create(obra: obra_4, presentacion: pres_3)
  ObraPresentacion.create(obra: obra_5, presentacion: pres_4)
  ObraPresentacion.create(obra: obra_6, presentacion: pres_4)
  ObraPresentacion.create(obra: obra_7, presentacion: pres_5)
  ObraPresentacion.create(obra: obra_8, presentacion: pres_5)
  ObraPresentacion.create(obra: obra_9, presentacion: pres_5)

  # 2019-10-09
  ObraPresentacion.create(obra: obra_1, presentacion: pres_6)
  ObraPresentacion.create(obra: obra_10, presentacion: pres_7)
  ObraPresentacion.create(obra: obra_11, presentacion: pres_7)
  ObraPresentacion.create(obra: obra_5, presentacion: pres_8)
  ObraPresentacion.create(obra: obra_6, presentacion: pres_8)
  ObraPresentacion.create(obra: obra_7, presentacion: pres_9)
  ObraPresentacion.create(obra: obra_8, presentacion: pres_9)
  ObraPresentacion.create(obra: obra_9, presentacion: pres_9)

  # 2019-10-11 12:00
  ObraPresentacion.create(obra: obra_12, presentacion: pres_10)
  ObraPresentacion.create(obra: obra_13, presentacion: pres_11)
  ObraPresentacion.create(obra: obra_14, presentacion: pres_11)
  ObraPresentacion.create(obra: obra_15, presentacion: pres_12)

  # 2019-10-11 12:00
  ObraPresentacion.create(obra: obra_11, presentacion: pres_13)
  ObraPresentacion.create(obra: obra_16, presentacion: pres_14)
  ObraPresentacion.create(obra: obra_9, presentacion: pres_15)
end

unless FechaActividad.any?
  fecha_actividad_1 = FechaActividad.create(encuentro: Encuentro.first, fecha: '2019-10-08', lugar: nil, tematica: nil)
  fecha_actividad_2 = FechaActividad.create(encuentro: Encuentro.first, fecha: '2019-10-09', lugar: 'Sala Subterráneo', tematica: 'Exposición y Luthería')
  fecha_actividad_3 = FechaActividad.create(encuentro: Encuentro.first, fecha: '2019-10-10', lugar: 'Sala Subterráneo', tematica: 'Exposición y Luthería')
  fecha_actividad_4 = FechaActividad.create(encuentro: Encuentro.first, fecha: '2019-10-11', lugar: 'Sala Subterráneo', tematica: 'Exposición y Luthería')
end

unless Actividad.any?
  # Fecha 1 (2019-10-08)
  Actividad.create(fecha_actividad: fecha_actividad_1, inicio: '09:00', termino: nil, titulo: 'Salida a Panguipulli', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_1, inicio: '11:30', termino: '13:00', titulo: 'Panguipulli', descripcion: 'Ingauguración clases estudiantes de colegios', lugar: 'Panguipulli')
  Actividad.create(fecha_actividad: fecha_actividad_1, inicio: '13:30', termino: '15:00', titulo: 'Almuerzo', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_1, inicio: '16:00', termino: '17:30', titulo: 'Clases Estudiantes', descripcion: nil, lugar: 'Casona Cultural')
  Actividad.create(fecha_actividad: fecha_actividad_1, inicio: '18:00', termino: '19:00', titulo: 'Coffee', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_1, inicio: '19:30', termino: nil, titulo: 'Concierto de Ingauguración', descripcion: nil, lugar: 'Casona Cultural Amigos de Panguipulli')
  # Fecha 2 (2019-10-09)
  Actividad.create(fecha_actividad: fecha_actividad_2, inicio: '10:00', termino: '10:45', titulo: 'Clase magistral Felipe García', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_2, inicio: '10:45', termino: '11:30', titulo: 'Clase individual Raúl Pimentel', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_2, inicio: '11:45', termino: '13:00', titulo: 'Charla Fernando Harms', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_2, inicio: '13:30', termino: '15:00', titulo: 'Almuerzo', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_2, inicio: '15:00', termino: '18:00', titulo: 'Ensambles Dir. Jorge Valdebenito', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_2, inicio: '18:00', termino: '18:30', titulo: 'Coffee', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_2, inicio: '19:30', termino: nil, titulo: 'Concierto', descripcion: nil, lugar: nil)
  # Fecha 3 (2019-10-10)
  Actividad.create(fecha_actividad: fecha_actividad_3, inicio: '10:00', termino: '10:45', titulo: 'Clase magistral Raúl Pimentel', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_3, inicio: '10:45', termino: '11:30', titulo: 'Clase individual Felipe García', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_3, inicio: '11:45', termino: '13:00', titulo: 'Clase Fernando Harms', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_3, inicio: '13:30', termino: '15:00', titulo: 'Almuerzo', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_3, inicio: '15:00', termino: '18:00', titulo: 'Ensambles Dir. Jorge Valdebenito', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_3, inicio: '18:00', termino: '18:30', titulo: 'Coffee', descripcion: nil, lugar: nil)
  # Fecha 4 (2019-10-11)
  Actividad.create(fecha_actividad: fecha_actividad_4, inicio: '10:00', termino: '11:30', titulo: 'Conversatorio Felipe García, Raúl Pimentel, María José Carrasqueira, Fernando Harms, Jorge Valdebenito, Florángel Mesko', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_4, inicio: '12:00', termino: '13:30', titulo: 'Concierto de mediodía', descripcion: nil, lugar: 'Sala Sergio Pineda')
  Actividad.create(fecha_actividad: fecha_actividad_4, inicio: '13:30', termino: '15:00', titulo: 'Almuerzo', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_4, inicio: '15:00', termino: '18:00', titulo: 'Ensambles Dir. Jorge Valdebenito', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_4, inicio: '18:00', termino: '18:30', titulo: 'Coffee', descripcion: nil, lugar: nil)
  Actividad.create(fecha_actividad: fecha_actividad_4, inicio: '19:30', termino: nil, titulo: 'Concierto Clausura', descripcion: nil, lugar: nil)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# REGIONES
Region.create(name: 'Arica y Parinacota',number: 'XV')
Region.create(name: 'Tarapacá',number: 'I')
Region.create(name: 'Antofagasta',number: 'II')
Region.create(name: 'Atacama',number: 'III')
Region.create(name: 'Coquimbo',number: 'IV')
Region.create(name: 'Valparaiso',number: 'V')
Region.create(name: 'Metropolitana de Santiago',number: 'RM')
Region.create(name: 'Libertador General Bernardo OHiggins',number: 'VI')
Region.create(name: 'Maule',number: 'VII')
Region.create(name: 'Biobío',number: 'VIII')
Region.create(name: 'La Araucanía',number: 'IX')
Region.create(name: 'Los Ríos',number: 'XIV')
Region.create(name: 'Los Lagos',number: 'X')
Region.create(name: 'Aisén del General Carlos Ibáñez del Campo',number: 'XI')
Region.create(name: 'Magallanes y de la Antártica Chilena',number: 'XII')
puts("Se Crearon Regiones")

# PROVINCIAS
Province.create(name: 'Arica', region_id: 1)
Province.create(name: 'Parinacota', region_id: 1)
Province.create(name: 'Iquique', region_id: 2)
Province.create(name: 'El Tamarugal', region_id: 2)
Province.create(name: 'Antofagasta', region_id: 3)
Province.create(name: 'El Loa', region_id: 3)
Province.create(name: 'Tocopilla', region_id: 3)
Province.create(name: 'Chañaral', region_id: 4)
Province.create(name: 'Copiapó', region_id: 4)
Province.create(name: 'Huasco', region_id: 4)
Province.create(name: 'Choapa', region_id: 5)
Province.create(name: 'Elqui', region_id: 5)
Province.create(name: 'Limarí', region_id: 5)
Province.create(name: 'Isla de Pascua', region_id: 6)
Province.create(name: 'Los Andes', region_id: 6)
Province.create(name: 'Petorca', region_id: 6)
Province.create(name: 'Quillota', region_id: 6)
Province.create(name: 'San Antonio', region_id: 6)
Province.create(name: 'San Felipe de Aconcagua', region_id: 6)
Province.create(name: 'Valparaiso', region_id: 6)
Province.create(name: 'Chacabuco', region_id: 7)
Province.create(name: 'Cordillera', region_id: 7)
Province.create(name: 'Maipo', region_id: 7)
Province.create(name: 'Melipilla', region_id: 7)
Province.create(name: 'Santiago', region_id: 7)
Province.create(name: 'Talagante', region_id: 7)
Province.create(name: 'Cachapoal', region_id: 8)
Province.create(name: 'Cardenal Caro', region_id: 8)
Province.create(name: 'Colchagua', region_id: 8)
Province.create(name: 'Cauquenes', region_id: 9)
Province.create(name: 'Curicó', region_id: 9)
Province.create(name: 'Linares', region_id: 9)
Province.create(name: 'Talca', region_id: 9)
Province.create(name: 'Arauco', region_id: 10)
Province.create(name: 'Bio Bío', region_id: 10)
Province.create(name: 'Concepción', region_id: 10)
Province.create(name: 'Ñuble', region_id: 10)
Province.create(name: 'Cautín', region_id: 11)
Province.create(name: 'Malleco', region_id: 11)
Province.create(name: 'Valdivia', region_id: 12)
Province.create(name: 'Ranco', region_id: 12)
Province.create(name: 'Chiloé', region_id: 13)
Province.create(name: 'Llanquihue', region_id: 13)
Province.create(name: 'Osorno', region_id: 13)
Province.create(name: 'Palena', region_id: 13)
Province.create(name: 'Aisén', region_id: 14)
Province.create(name: 'Capitán Prat', region_id: 14)
Province.create(name: 'Coihaique', region_id: 14)
Province.create(name: 'General Carrera', region_id: 14)
Province.create(name: 'Antártica Chilena', region_id: 15)
Province.create(name: 'Magallanes', region_id: 15)
Province.create(name: 'Tierra del Fuego', region_id: 15)
Province.create(name: 'Última Esperanza', region_id: 15)
puts("Se crearon Provincias")

# COMUN province_id: AS
Commune.create(name: 'Arica', province_id: 1)
Commune.create(name: 'Camarones', province_id: 1)
Commune.create(name: 'General Lagos', province_id: 2)
Commune.create(name: 'Putre', province_id: 2)
Commune.create(name: 'Alto Hospicio', province_id: 3)
Commune.create(name: 'Iquique', province_id: 3)
Commune.create(name: 'Camiña', province_id: 4)
Commune.create(name: 'Colchane', province_id: 4)
Commune.create(name: 'Huara', province_id: 4)
Commune.create(name: 'Pica', province_id: 4)
Commune.create(name: 'Pozo Almonte', province_id: 4)
Commune.create(name: 'Antofagasta', province_id: 5)
Commune.create(name: 'Mejillones', province_id: 5)
Commune.create(name: 'Sierra Gorda', province_id: 5)
Commune.create(name: 'Taltal', province_id: 5)
Commune.create(name: 'Calama', province_id: 6)
Commune.create(name: 'Ollague', province_id: 6)
Commune.create(name: 'San Pedro de Atacama', province_id: 6)
Commune.create(name: 'María Elena', province_id: 7)
Commune.create(name: 'Tocopilla', province_id: 7)
Commune.create(name: 'Chañaral', province_id: 8)
Commune.create(name: 'Diego de Almagro', province_id: 8)
Commune.create(name: 'Caldera', province_id: 9)
Commune.create(name: 'Copiapó', province_id: 9)
Commune.create(name: 'Tierra Amarilla', province_id: 9)
Commune.create(name: 'Alto del Carmen', province_id: 10)
Commune.create(name: 'Freirina', province_id: 10)
Commune.create(name: 'Huasco', province_id: 10)
Commune.create(name: 'Vallenar', province_id: 10)
Commune.create(name: 'Canela', province_id: 11)
Commune.create(name: 'Illapel', province_id: 11)
Commune.create(name: 'Los Vilos', province_id: 11)
Commune.create(name: 'Salamanca', province_id: 11)
Commune.create(name: 'Andacollo', province_id: 12)
Commune.create(name: 'Coquimbo', province_id: 12)
Commune.create(name: 'La Higuera', province_id: 12)
Commune.create(name: 'La Serena', province_id: 12)
Commune.create(name: 'Paihuaco', province_id: 12)
Commune.create(name: 'Vicuña', province_id: 12)
Commune.create(name: 'Combarbalá', province_id: 13)
Commune.create(name: 'Monte Patria', province_id: 13)
Commune.create(name: 'Ovalle', province_id: 13)
Commune.create(name: 'Punitaqui', province_id: 13)
Commune.create(name: 'Río Hurtado', province_id: 13)
Commune.create(name: 'Isla de Pascua', province_id: 14)
Commune.create(name: 'Calle Larga', province_id: 15)
Commune.create(name: 'Los Andes', province_id: 15)
Commune.create(name: 'Rinconada', province_id: 15)
Commune.create(name: 'San Esteban', province_id: 15)
Commune.create(name: 'La Ligua', province_id: 16)
Commune.create(name: 'Papudo', province_id: 16)
Commune.create(name: 'Petorca', province_id: 16)
Commune.create(name: 'Zapallar', province_id: 16)
Commune.create(name: 'Hijuelas', province_id: 17)
Commune.create(name: 'La Calera', province_id: 17)
Commune.create(name: 'La Cruz', province_id: 17)
Commune.create(name: 'Limache', province_id: 17)
Commune.create(name: 'Nogales', province_id: 17)
Commune.create(name: 'Olmué', province_id: 17)
Commune.create(name: 'Quillota', province_id: 17)
Commune.create(name: 'Algarrobo', province_id: 18)
Commune.create(name: 'Cartagena', province_id: 18)
Commune.create(name: 'El Quisco', province_id: 18)
Commune.create(name: 'El Tabo', province_id: 18)
Commune.create(name: 'San Antonio', province_id: 18)
Commune.create(name: 'Santo Domingo', province_id: 18)
Commune.create(name: 'Catemu', province_id: 19)
Commune.create(name: 'Llaillay', province_id: 19)
Commune.create(name: 'Panquehue', province_id: 19)
Commune.create(name: 'Putaendo', province_id: 19)
Commune.create(name: 'San Felipe', province_id: 19)
Commune.create(name: 'Santa María', province_id: 19)
Commune.create(name: 'Casablanca', province_id: 20)
Commune.create(name: 'Concón', province_id: 20)
Commune.create(name: 'Juan Fernández', province_id: 20)
Commune.create(name: 'Puchuncaví', province_id: 20)
Commune.create(name: 'Quilpué', province_id: 20)
Commune.create(name: 'Quintero', province_id: 20)
Commune.create(name: 'Valparaíso', province_id: 20)
Commune.create(name: 'Villa Alemana', province_id: 20)
Commune.create(name: 'Viña del Mar', province_id: 20)
Commune.create(name: 'Colina', province_id: 21)
Commune.create(name: 'Lampa', province_id: 21)
Commune.create(name: 'Tiltil', province_id: 21)
Commune.create(name: 'Pirque', province_id: 22)
Commune.create(name: 'Puente Alto', province_id: 22)
Commune.create(name: 'San José de Maipo', province_id: 22)
Commune.create(name: 'Buin', province_id: 23)
Commune.create(name: 'Calera de Tango', province_id: 23)
Commune.create(name: 'Paine', province_id: 23)
Commune.create(name: 'San Bernardo', province_id: 23)
Commune.create(name: 'Alhué', province_id: 24)
Commune.create(name: 'Curacaví', province_id: 24)
Commune.create(name: 'María Pinto', province_id: 24)
Commune.create(name: 'Melipilla', province_id: 24)
Commune.create(name: 'San Pedro', province_id: 24)
Commune.create(name: 'Cerrillos', province_id: 25)
Commune.create(name: 'Cerro Navia', province_id: 25)
Commune.create(name: 'Conchalí', province_id: 25)
Commune.create(name: 'El Bosque', province_id: 25)
Commune.create(name: 'Estación Central', province_id: 25)
Commune.create(name: 'Huechuraba', province_id: 25)
Commune.create(name: 'Independencia', province_id: 25)
Commune.create(name: 'La Cisterna', province_id: 25)
Commune.create(name: 'La Granja', province_id: 25)
Commune.create(name: 'La Florida', province_id: 25)
Commune.create(name: 'La Pintana', province_id: 25)
Commune.create(name: 'La Reina', province_id: 25)
Commune.create(name: 'Las Condes', province_id: 25)
Commune.create(name: 'Lo Barnechea', province_id: 25)
Commune.create(name: 'Lo Espejo', province_id: 25)
Commune.create(name: 'Lo Prado', province_id: 25)
Commune.create(name: 'Macul', province_id: 25)
Commune.create(name: 'Maipú', province_id: 25)
Commune.create(name: 'Ñuñoa', province_id: 25)
Commune.create(name: 'Pedro Aguirre Cerda', province_id: 25)
Commune.create(name: 'Peñalolén', province_id: 25)
Commune.create(name: 'Providencia', province_id: 25)
Commune.create(name: 'Pudahuel', province_id: 25)
Commune.create(name: 'Quilicura', province_id: 25)
Commune.create(name: 'Quinta Normal', province_id: 25)
Commune.create(name: 'Recoleta', province_id: 25)
Commune.create(name: 'Renca', province_id: 25)
Commune.create(name: 'San Miguel', province_id: 25)
Commune.create(name: 'San Joaquín', province_id: 25)
Commune.create(name: 'San Ramón', province_id: 25)
Commune.create(name: 'Santiago', province_id: 25)
Commune.create(name: 'Vitacura', province_id: 25)
Commune.create(name: 'El Monte', province_id: 26)
Commune.create(name: 'Isla de Maipo', province_id: 26)
Commune.create(name: 'Padre Hurtado', province_id: 26)
Commune.create(name: 'Peñaflor', province_id: 26)
Commune.create(name: 'Talagante', province_id: 26)
Commune.create(name: 'Codegua', province_id: 27)
Commune.create(name: 'Coínco', province_id: 27)
Commune.create(name: 'Coltauco', province_id: 27)
Commune.create(name: 'Doñihue', province_id: 27)
Commune.create(name: 'Graneros', province_id: 27)
Commune.create(name: 'Las Cabras', province_id: 27)
Commune.create(name: 'Machalí', province_id: 27)
Commune.create(name: 'Malloa', province_id: 27)
Commune.create(name: 'Mostazal', province_id: 27)
Commune.create(name: 'Olivar', province_id: 27)
Commune.create(name: 'Peumo', province_id: 27)
Commune.create(name: 'Pichidegua', province_id: 27)
Commune.create(name: 'Quinta de Tilcoco', province_id: 27)
Commune.create(name: 'Rancagua', province_id: 27)
Commune.create(name: 'Rengo', province_id: 27)
Commune.create(name: 'Requínoa', province_id: 27)
Commune.create(name: 'San Vicente de Tagua Tagua', province_id: 27)
Commune.create(name: 'La Estrella', province_id: 28)
Commune.create(name: 'Litueche', province_id: 28)
Commune.create(name: 'Marchihue', province_id: 28)
Commune.create(name: 'Navidad', province_id: 28)
Commune.create(name: 'Peredones', province_id: 28)
Commune.create(name: 'Pichilemu', province_id: 28)
Commune.create(name: 'Chépica', province_id: 29)
Commune.create(name: 'Chimbarongo', province_id: 29)
Commune.create(name: 'Lolol', province_id: 29)
Commune.create(name: 'Nancagua', province_id: 29)
Commune.create(name: 'Palmilla', province_id: 29)
Commune.create(name: 'Peralillo', province_id: 29)
Commune.create(name: 'Placilla', province_id: 29)
Commune.create(name: 'Pumanque', province_id: 29)
Commune.create(name: 'San Fernando', province_id: 29)
Commune.create(name: 'Santa Cruz', province_id: 29)
Commune.create(name: 'Cauquenes', province_id: 30)
Commune.create(name: 'Chanco', province_id: 30)
Commune.create(name: 'Pelluhue', province_id: 30)
Commune.create(name: 'Curicó', province_id: 31)
Commune.create(name: 'Hualañé', province_id: 31)
Commune.create(name: 'Licantén', province_id: 31)
Commune.create(name: 'Molina', province_id: 31)
Commune.create(name: 'Rauco', province_id: 31)
Commune.create(name: 'Romeral', province_id: 31)
Commune.create(name: 'Sagrada Familia', province_id: 31)
Commune.create(name: 'Teno', province_id: 31)
Commune.create(name: 'Vichuquén', province_id: 31)
Commune.create(name: 'Colbún', province_id: 32)
Commune.create(name: 'Linares', province_id: 32)
Commune.create(name: 'Longaví', province_id: 32)
Commune.create(name: 'Parral', province_id: 32)
Commune.create(name: 'Retiro', province_id: 32)
Commune.create(name: 'San Javier', province_id: 32)
Commune.create(name: 'Villa Alegre', province_id: 32)
Commune.create(name: 'Yerbas Buenas', province_id: 32)
Commune.create(name: 'Constitución', province_id: 33)
Commune.create(name: 'Curepto', province_id: 33)
Commune.create(name: 'Empedrado', province_id: 33)
Commune.create(name: 'Maule', province_id: 33)
Commune.create(name: 'Pelarco', province_id: 33)
Commune.create(name: 'Pencahue', province_id: 33)
Commune.create(name: 'Río Claro', province_id: 33)
Commune.create(name: 'San Clemente', province_id: 33)
Commune.create(name: 'San Rafael', province_id: 33)
Commune.create(name: 'Talca', province_id: 33)
Commune.create(name: 'Arauco', province_id: 34)
Commune.create(name: 'Cañete', province_id: 34)
Commune.create(name: 'Contulmo', province_id: 34)
Commune.create(name: 'Curanilahue', province_id: 34)
Commune.create(name: 'Lebu', province_id: 34)
Commune.create(name: 'Los Álamos', province_id: 34)
Commune.create(name: 'Tirúa', province_id: 34)
Commune.create(name: 'Alto Biobío', province_id: 35)
Commune.create(name: 'Antuco', province_id: 35)
Commune.create(name: 'Cabrero', province_id: 35)
Commune.create(name: 'Laja', province_id: 35)
Commune.create(name: 'Los Ángeles', province_id: 35)
Commune.create(name: 'Mulchén', province_id: 35)
Commune.create(name: 'Nacimiento', province_id: 35)
Commune.create(name: 'Negrete', province_id: 35)
Commune.create(name: 'Quilaco', province_id: 35)
Commune.create(name: 'Quilleco', province_id: 35)
Commune.create(name: 'San Rosendo', province_id: 35)
Commune.create(name: 'Santa Bárbara', province_id: 35)
Commune.create(name: 'Tucapel', province_id: 35)
Commune.create(name: 'Yumbel', province_id: 35)
Commune.create(name: 'Chiguayante', province_id: 36)
Commune.create(name: 'Concepción', province_id: 36)
Commune.create(name: 'Coronel', province_id: 36)
Commune.create(name: 'Florida', province_id: 36)
Commune.create(name: 'Hualpén', province_id: 36)
Commune.create(name: 'Hualqui', province_id: 36)
Commune.create(name: 'Lota', province_id: 36)
Commune.create(name: 'Penco', province_id: 36)
Commune.create(name: 'San Pedro de La Paz', province_id: 36)
Commune.create(name: 'Santa Juana', province_id: 36)
Commune.create(name: 'Talcahuano', province_id: 36)
Commune.create(name: 'Tomé', province_id: 36)
Commune.create(name: 'Bulnes', province_id: 37)
Commune.create(name: 'Chillán', province_id: 37)
Commune.create(name: 'Chillán Viejo', province_id: 37)
Commune.create(name: 'Cobquecura', province_id: 37)
Commune.create(name: 'Coelemu', province_id: 37)
Commune.create(name: 'Coihueco', province_id: 37)
Commune.create(name: 'El Carmen', province_id: 37)
Commune.create(name: 'Ninhue', province_id: 37)
Commune.create(name: 'Ñiquen', province_id: 37)
Commune.create(name: 'Pemuco', province_id: 37)
Commune.create(name: 'Pinto', province_id: 37)
Commune.create(name: 'Portezuelo', province_id: 37)
Commune.create(name: 'Quillón', province_id: 37)
Commune.create(name: 'Quirihue', province_id: 37)
Commune.create(name: 'Ránquil', province_id: 37)
Commune.create(name: 'San Carlos', province_id: 37)
Commune.create(name: 'San Fabián', province_id: 37)
Commune.create(name: 'San Ignacio', province_id: 37)
Commune.create(name: 'San Nicolás', province_id: 37)
Commune.create(name: 'Treguaco', province_id: 37)
Commune.create(name: 'Yungay', province_id: 37)
Commune.create(name: 'Carahue', province_id: 38)
Commune.create(name: 'Cholchol', province_id: 38)
Commune.create(name: 'Cunco', province_id: 38)
Commune.create(name: 'Curarrehue', province_id: 38)
Commune.create(name: 'Freire', province_id: 38)
Commune.create(name: 'Galvarino', province_id: 38)
Commune.create(name: 'Gorbea', province_id: 38)
Commune.create(name: 'Lautaro', province_id: 38)
Commune.create(name: 'Loncoche', province_id: 38)
Commune.create(name: 'Melipeuco', province_id: 38)
Commune.create(name: 'Nueva Imperial', province_id: 38)
Commune.create(name: 'Padre Las Casas', province_id: 38)
Commune.create(name: 'Perquenco', province_id: 38)
Commune.create(name: 'Pitrufquén', province_id: 38)
Commune.create(name: 'Pucón', province_id: 38)
Commune.create(name: 'Saavedra', province_id: 38)
Commune.create(name: 'Temuco', province_id: 38)
Commune.create(name: 'Teodoro Schmidt', province_id: 38)
Commune.create(name: 'Toltén', province_id: 38)
Commune.create(name: 'Vilcún', province_id: 38)
Commune.create(name: 'Villarrica', province_id: 38)
Commune.create(name: 'Angol', province_id: 39)
Commune.create(name: 'Collipulli', province_id: 39)
Commune.create(name: 'Curacautín', province_id: 39)
Commune.create(name: 'Ercilla', province_id: 39)
Commune.create(name: 'Lonquimay', province_id: 39)
Commune.create(name: 'Los Sauces', province_id: 39)
Commune.create(name: 'Lumaco', province_id: 39)
Commune.create(name: 'Purén', province_id: 39)
Commune.create(name: 'Renaico', province_id: 39)
Commune.create(name: 'Traiguén', province_id: 39)
Commune.create(name: 'Victoria', province_id: 39)
Commune.create(name: 'Corral', province_id: 40)
Commune.create(name: 'Lanco', province_id: 40)
Commune.create(name: 'Los Lagos', province_id: 40)
Commune.create(name: 'Máfil', province_id: 40)
Commune.create(name: 'Mariquina', province_id: 40)
Commune.create(name: 'Paillaco', province_id: 40)
Commune.create(name: 'Panguipulli', province_id: 40)
Commune.create(name: 'Valdivia', province_id: 40)
Commune.create(name: 'Futrono', province_id: 41)
Commune.create(name: 'La Unión', province_id: 41)
Commune.create(name: 'Lago Ranco', province_id: 41)
Commune.create(name: 'Río Bueno', province_id: 41)
Commune.create(name: 'Ancud', province_id: 42)
Commune.create(name: 'Castro', province_id: 42)
Commune.create(name: 'Chonchi', province_id: 42)
Commune.create(name: 'Curaco de Vélez', province_id: 42)
Commune.create(name: 'Dalcahue', province_id: 42)
Commune.create(name: 'Puqueldón', province_id: 42)
Commune.create(name: 'Queilén', province_id: 42)
Commune.create(name: 'Quemchi', province_id: 42)
Commune.create(name: 'Quellón', province_id: 42)
Commune.create(name: 'Quinchao', province_id: 42)
Commune.create(name: 'Calbuco', province_id: 43)
Commune.create(name: 'Cochamó', province_id: 43)
Commune.create(name: 'Fresia', province_id: 43)
Commune.create(name: 'Frutillar', province_id: 43)
Commune.create(name: 'Llanquihue', province_id: 43)
Commune.create(name: 'Los Muermos', province_id: 43)
Commune.create(name: 'Maullín', province_id: 43)
Commune.create(name: 'Puerto Montt', province_id: 43)
Commune.create(name: 'Puerto Varas', province_id: 43)
Commune.create(name: 'Osorno', province_id: 44)
Commune.create(name: 'Puero Octay', province_id: 44)
Commune.create(name: 'Purranque', province_id: 44)
Commune.create(name: 'Puyehue', province_id: 44)
Commune.create(name: 'Río Negro', province_id: 44)
Commune.create(name: 'San Juan de la Costa', province_id: 44)
Commune.create(name: 'San Pablo', province_id: 44)
Commune.create(name: 'Chaitén', province_id: 45)
Commune.create(name: 'Futaleufú', province_id: 45)
Commune.create(name: 'Hualaihué', province_id: 45)
Commune.create(name: 'Palena', province_id: 45)
Commune.create(name: 'Aisén', province_id: 46)
Commune.create(name: 'Cisnes', province_id: 46)
Commune.create(name: 'Guaitecas', province_id: 46)
Commune.create(name: 'Cochrane', province_id: 47)
Commune.create(name: 'Ohiggins', province_id: 47)
Commune.create(name: 'Tortel', province_id: 47)
Commune.create(name: 'Coihaique', province_id: 48)
Commune.create(name: 'Lago Verde', province_id: 48)
Commune.create(name: 'Chile Chico', province_id: 49)
Commune.create(name: 'Río Ibáñez', province_id: 49)
Commune.create(name: 'Antártica', province_id: 50)
Commune.create(name: 'Cabo de Hornos', province_id: 50)
Commune.create(name: 'Laguna Blanca', province_id: 51)
Commune.create(name: 'Punta Arenas', province_id: 51)
Commune.create(name: 'Río Verde', province_id: 51)
Commune.create(name: 'San Gregorio', province_id: 51)
Commune.create(name: 'Porvenir', province_id: 52)
Commune.create(name: 'Primavera', province_id: 52)
Commune.create(name: 'Timaukel', province_id: 52)
Commune.create(name: 'Natales', province_id: 53)
Commune.create(name: 'Torres del Paine', province_id: 53)
puts("Se crearon Comunas")

#Categorias
Category.create(
    name: "Jeans", 
    description: "En Latino-América se usa la palabra jeans [leer yins] o bluejeans (jeans azules) para referirse a los pantalones de mezclilla o denim. La palabra jean viene del inglés y esta del francés: jean fustian la cual se referiría a una tela de algodón (fustian) de Génova."
)
Category.create(
    name: "Chaquetas", 
    description: "Una chaqueta es una prenda de vestir de calle ajustada al torso, con manga larga, solapas y bolsillos, tanto interiores como exteriores, abierta por delante con una botonadura, que permite llevarse abierta o cerrada."
)
puts ("Se crearon Categorias")

#Marcas
Mark.create(
    name: "Brussi",
    description: "BRUSSI es una marca Colombiana con mas de 20 años en el mercado enfocada en realzar la belleza de la mujer Latina, creando diseños exclusivos y de alta calidad, pensando en el día a día de nuestros clientes tanto nacionales como internacionales, fabricamos diferentes tipos de jeans y blusas ubicándonos como una empresa de trayectoria y experiencia.
    Nuestras prendas son producidas bajo rigurosos controles de calidad,  elaboradas con telas, insumos y mano de obra colombiana, dando cumplimiento a nuestras políticas de seguridad social y laboral y aportando a la economía del país.  Nuestra meta es mejorar cada día más para así poder ofrecer una mejor calidad a nuestro consumidor final."
)
Mark.create(
    name: "Dirtyjeans",
    description: "En Dirty Jeans desarrollamos y diseñamos vestuario juvenil semi formal con sello urbano y moderno, exclusivo para mujeres y hombres que buscan calidad, estilo y elegancia.
    Mas de 20 años avalan nuestro trabajo, dedicándonos a la venta directa en nuestros 6 locales y también a la venta Mayorista, distribuyendo a todo el país.
    Dirty Jeans desea integrar exclusividad y vanguardia en sus modelos, logrando que cada mujer se sienta única."
)
Mark.create(
    name: "Paradise",
    description: "18 Años fabricando en Chile los mejores jeans."
)
puts ("Se crean Marcas ")

#Modelo de productos
ModelProduct.create(
    name: "Full buttons celeste",
    mark_id: 1
)
ModelProduct.create(
    name: "Jeans básico azul",
    mark_id: 2
)
ModelProduct.create(
    name: "Flare",
    mark_id: 3
)
ModelProduct.create(
    name: "Mom jeans",
    mark_id: 1
)
ModelProduct.create(
    name: "Gravillado",
    mark_id: 2
)
ModelProduct.create(
    name: "Jeans lazo",
    mark_id: 3
)
puts ("Se crean Modelos segun marca")

#Tipos de talla
SizeType.create(
    name: "Numero"
)
SizeType.create(
    name: "Letra"
)
puts ("Se crean tipos de talla")

#Tallas
#Tallas numerales
SizeProduct.create(
    name: "36",
    size_type_id: 1
)
SizeProduct.create(
    name: "37",
    size_type_id: 1
)
SizeProduct.create(
    name: "38",
    size_type_id: 1
)
SizeProduct.create(
    name: "39",
    size_type_id: 1
)
SizeProduct.create(
    name: "40",
    size_type_id: 1
)
SizeProduct.create(
    name: "41",
    size_type_id: 1
)
SizeProduct.create(
    name: "42",
    size_type_id: 1
)
SizeProduct.create(
    name: "43",
    size_type_id: 1
)
SizeProduct.create(
    name: "44",
    size_type_id: 1
)
SizeProduct.create(
    name: "45",
    size_type_id: 1
)
SizeProduct.create(
    name: "46",
    size_type_id: 1
)

#Tallas Letras
SizeProduct.create(
    name: "S",
    size_type_id: 2
)
SizeProduct.create(
    name: "M",
    size_type_id: 2
)
SizeProduct.create(
    name: "L",
    size_type_id: 2
)
SizeProduct.create(
    name: "XL",
    size_type_id: 2
)
puts ("Se crean Tallas En numeros y letras")

#Type Order
OrderType.create(
    name: "Contra Entrega",
    description: "Se le entraga producto a cliente en su domicilio (Coquimbo o La Serena) y se paga el producto"
)

OrderType.create(
    name: "Despacho a Regiones",
    description: "Se le envia el producto al cliente por Pullman Cargo previo pago del producto y el cliente paga al provvedor de transporte"
)
puts ("Se crean Tipos de Orden")


#Type status order

OrderStatus.create(
    name: "En Curso",
    description: "Cliente esta comprando y agregando prodyctos al carro",
    type_order: 3
)

OrderStatus.create(
    name: "Pendiente de Contra entrega",
    description: "Cliente Completa el carro pero esta pendiente Entrega y pago",
    type_order: 1
)

OrderStatus.create(
    name: "Pendiente de Envio por Pago",
    description: "Cliente Completa el carro pero esta pendiente ya que el pago de la orde",
    type_order: 2
)

OrderStatus.create(
    name: "Pendiente de Envio",
    description: "Cliente Completa el carro pero esta pendiente ya que no se ha enviado al proveedor de transporte",
    type_order: 2
)

OrderStatus.create(
    name: "Pendiente de Entrega",
    description: "Se entrego producto al proveedor prducto se encuentra en camino",
    type_order: 2
)

OrderStatus.create(
    name: "Cancelado por Cliente",
    description: "Cliente Cancela Orden",
    type_order: 3
)

OrderStatus.create(
    name: "Cancelado por Administrador",
    description: "Administrador Cancela Orden",
    type_order: 3
)

puts ("Se crean Estados de orden")
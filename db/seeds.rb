# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Role.create!([
#   {
#     name: 'superadmin'
#   },
#   {
#     name: 'admin'
#   },
#   {
#     name: 'bupati'
#   },
#   {
#     name: 'TU Setda'
#   },
#   {
#     name: 'SKPD'
#   },
#   {
#     name: 'TAPD'
#   },
#   {
#     name: 'Pemohon'
#   }
# ])

Role.where('id in (8,9,10,11,12,13,14)').delete_all


# User.create!([
#   {
#     email: 'admin@sahate.purwakartakab.go.id',
#     password: 'sahatepurwakartasuperadmin',
#     role_id: 1
#   }
# ])

# Kategori.create!([
#   {
#     name: 'Perencanaan Pembangunan'
#   },
#   {
#     name: 'Lingkungan Hidup'
#   },
#   {
#     name: 'Pemberdayaan Perempuan dan Perlindungan Anak'
#   },
#   {
#     name: 'Kesatuan Bangsa dan Politik dalam Negeri'
#   },
#   {
#     name: 'Penanaman Modal'
#   },
#   {
#     name: 'Pendidikan'
#   },
#   {
#     name: 'Kesehatan'
#   },
#   {
#     name: 'Pekerjaan Umum Bidang Jalan dan Jemabatan'
#   },
#   {
#     name: 'Perumahan dan Urusan Penataan Ruang'
#   },
#   {
#     name: 'Perhubungan'
#   },
#   {
#     name: 'Kependudukan dan Catatan Sipil'
#   },
#   {
#     name: 'Sosial, Keagamaan/Peribadatan dan Pendidikan Agama'
#   },
#   {
#     name: 'Kesejahteraan Sosial'
#   },
#   {
#     name: 'Ketenagakerjaan'
#   },
#   {
#     name: 'Koperasi dan Usaha Kecil Menengah'
#   },
#   {
#     name: 'Kepemudaan dan Olah Raga Non Profesional'
#   },
#   {
#     name: 'Kebudayaan dan Adat Istiadat, Pariwisata dan Kesenian'
#   },
#   {
#     name: 'Komunikasi dan Informatika'
#   },
#   {
#     name: 'Pertanian'
#   },
#   {
#     name: 'Otonomi Daerah dan Pemerintahan Umum'
#   },
#   {
#     name: 'Perusahaan Daerah dan Perekonomian'
#   },
#   {
#     name: 'Kearsipan'
#   }
# ])

# Homepage.create!([
#   {
#     gambar_1: File.open(Rails.root + "app/assets/images/sitbul.jpg"),
#     text_1_1: 'Sahate Purwakarta',
#     text_1_2: 'Mari wujudkan ide kreaif bersama dengan wujud yang terbuka',
#     text_1_3: 'Demi kepentingan bersama',
#     gambar_2: File.open(Rails.root + "app/assets/images/f857ef6aca2e882f3a62cb1b42100c09.jpg"),
#     text_2_1: 'Tapi tidak semua dapat tersalurkan. Sahate, semua ide kreatif diharapkan dapat diwujudkan dengan jalan keterbukaan via teknologi.',
#     text_2_2: 'Sehingga semua bisa dapat merealisasikan kesempatan yang sama secara adil tanpa penyelewengan.',
#     gambar_3: File.open(Rails.root + "app/assets/images/air-mancur-kangdedimenyapanet.jpg"),
#     text_3_1: 'Demi kepentingan bersama.',
#     text_3_2: 'Mari wujudkan ide kreaif bersama dengan wujud yang terbuka.',
#   }
# ])
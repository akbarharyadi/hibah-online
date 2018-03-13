# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create!([
  {
    name: 'superadmin'
  },
  {
    name: 'admin'
  },
  {
    name: 'bupati'
  },
  {
    name: 'TU Setda'
  },
  {
    name: 'SKPD'
  },
  {
    name: 'TAPD'
  },
  {
    name: 'pemohon'
  }
])


User.create!([
  {
    email: 'superadmin@sahate.purwakartakab.go.id',
    password: 'sahatepurwakartasuperadmin'
  }
])

Kategori.create!([
  {
    name: 'Perencanaan Pembangunan'
  },
  {
    name: 'Lingkungan Hidup'
  },
  {
    name: 'Pemberdayaan Perempuan dan Perlindungan Anak'
  },
  {
    name: 'Kesatuan Bangsa dan Politik dalam Negeri'
  },
  {
    name: 'Penanaman Modal'
  },
  {
    name: 'Pendidikan'
  },
  {
    name: 'Kesehatan'
  },
  {
    name: 'Pekerjaan Umum Bidang Jalan dan Jemabatan'
  },
  {
    name: 'Perumahan dan Urusan Penataan Ruang'
  },
  {
    name: 'Perhubungan'
  },
  {
    name: 'Kependudukan dan Catatan Sipil'
  },
  {
    name: 'Sosial, Keagamaan/Peribadatan dan Pendidikan Agama'
  },
  {
    name: 'Kesejahteraan Sosial'
  },
  {
    name: 'Ketenagakerjaan'
  },
  {
    name: 'Koperasi dan Usaha Kecil Menengah'
  },
  {
    name: 'Kepemudaan dan Olah Raga Non Profesional'
  },
  {
    name: 'Kebudayaan dan Adat Istiadat, Pariwisata dan Kesenian'
  },
  {
    name: 'Komunikasi dan Informatika'
  },
  {
    name: 'Pertanian'
  },
  {
    name: 'Otonomi Daerah dan Pemerintahan Umum'
  },
  {
    name: 'Perusahaan Daerah dan Perekonomian'
  },
  {
    name: 'Kearsipan'
  }
])
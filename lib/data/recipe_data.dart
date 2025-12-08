import 'package:nusantara_eats/models/recipe.dart';

final List<Recipe> recipes = [
  Recipe(
    id: 'rendang',
    name: 'Rendang',
    origin: 'Padang, Sumatera Barat',
    imageUrl:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1200&q=80&sat=-12',
    rating: 4.9,
    price: 85000,
    description:
        'Daging sapi dimasak lama dengan santan dan rempah kaya, menghasilkan rasa gurih pedas yang dalam.',
    ingredients: [
      '500g daging sapi',
      '400ml santan kental',
      '2 batang serai, geprek',
      '4 lembar daun jeruk',
      'Bumbu halus: cabai, bawang, jahe, lengkuas',
    ],
    steps: [
      'Tumis bumbu halus hingga harum.',
      'Masukkan daging, aduk hingga berubah warna.',
      'Tuang santan, masak kecil hingga kuah menyusut dan berminyak.',
    ],
  ),
  Recipe(
    id: 'sate-ayam',
    name: 'Sate Ayam Madura',
    origin: 'Madura, Jawa Timur',
    imageUrl:
        'https://images.unsplash.com/photo-1490645935967-10de6ba17061?auto=format&fit=crop&w=1200&q=80&sat=-10',
    rating: 4.7,
    price: 42000,
    description:
        'Potongan ayam panggang dengan bumbu kacang gurih manis, disajikan dengan lontong.',
    ingredients: [
      '400g dada ayam, potong dadu',
      'Tusuk sate secukupnya',
      'Bumbu marinasi kecap & bawang',
      'Saus kacang tanah halus',
      'Kecap manis dan jeruk limau',
    ],
    steps: [
      'Marinasi ayam dengan kecap dan bawang minimal 30 menit.',
      'Tusuk ayam, lalu panggang hingga matang.',
      'Siram saus kacang dan kecap, sajikan dengan jeruk limau.',
    ],
  ),
  Recipe(
    id: 'nasi-goreng',
    name: 'Nasi Goreng',
    origin: 'Jakarta',
    imageUrl:
        'https://images.unsplash.com/photo-1525755662778-989d0524087e?auto=format&fit=crop&w=1200&q=80',
    rating: 4.6,
    price: 30000,
    description:
        'Nasi goreng klasik dengan kecap manis, telur orak-arik, dan topping kerupuk.',
    ingredients: [
      '2 piring nasi putih dingin',
      '2 siung bawang putih, cincang',
      '2 butir telur',
      '2 sdm kecap manis',
      'Ayam suwir & sayuran beku',
    ],
    steps: [
      'Tumis bawang hingga harum, masukkan telur lalu orak-arik.',
      'Masukkan nasi, kecap, dan ayam suwir; aduk rata.',
      'Tambahkan sayuran, koreksi rasa, sajikan hangat.',
    ],
  ),
  Recipe(
    id: 'gudeg',
    name: 'Gudeg',
    origin: 'Yogyakarta',
    imageUrl:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1200&q=80',
    rating: 4.8,
    price: 55000,
    description:
        'Nangka muda dimasak lama dengan santan dan gula merah, disajikan dengan krecek dan telur.',
    ingredients: [
      '500g nangka muda',
      '400ml santan',
      '2 butir telur rebus',
      'Gula merah, daun salam, lengkuas',
      'Kerupuk kulit (krecek)',
    ],
    steps: [
      'Rebus nangka hingga empuk, tiriskan.',
      'Masak dengan santan, gula merah, dan bumbu hingga meresap.',
      'Sajikan dengan telur dan krecek pedas.',
    ],
  ),
  Recipe(
    id: 'soto-betawi',
    name: 'Soto Betawi',
    origin: 'Jakarta',
    imageUrl:
        'https://images.unsplash.com/photo-1467003909585-2f8a72700288?auto=format&fit=crop&w=1200&q=80&sat=-10',
    rating: 4.5,
    price: 48000,
    description:
        'Soto santan khas Betawi dengan daging sapi, kentang goreng, dan tomat segar.',
    ingredients: [
      '400g daging sapi',
      '300ml santan',
      'Kentang goreng, tomat, daun bawang',
      'Bumbu halus: bawang, kemiri, ketumbar',
      'Jeruk limau & emping',
    ],
    steps: [
      'Rebus daging hingga empuk, sisihkan.',
      'Tumis bumbu halus lalu masukkan santan dan daging.',
      'Sajikan dengan pelengkap kentang, tomat, emping, dan jeruk.',
    ],
  ),
  Recipe(
    id: 'gado-gado',
    name: 'Gado-Gado',
    origin: 'Jakarta',
    imageUrl:
        'https://images.unsplash.com/photo-1470337458703-46ad1756a187?auto=format&fit=crop&w=1200&q=80&sat=-8',
    rating: 4.4,
    price: 32000,
    description:
        'Salad sayur rebus dengan saus kacang kental, dilengkapi telur dan kerupuk.',
    ingredients: [
      'Kangkung, kol, tauge, kentang rebus',
      'Tahu & tempe goreng',
      'Telur rebus',
      'Saus kacang: kacang tanah, gula merah, cabai',
      'Kerupuk dan lontong opsional',
    ],
    steps: [
      'Rebus sayuran hingga matang, tiriskan.',
      'Haluskan saus kacang lalu masak hingga kental.',
      'Siram saus di atas sayur, tambah telur dan kerupuk.',
    ],
  ),
  Recipe(
    id: 'pempek',
    name: 'Pempek',
    origin: 'Palembang, Sumatera Selatan',
    imageUrl:
        'https://images.unsplash.com/photo-1525755662778-989d0524087e?auto=format&fit=crop&w=1200&q=80',
    rating: 4.3,
    price: 38000,
    description:
        'Olahan ikan tenggiri dan sagu, disajikan dengan kuah cuko asam pedas manis.',
    ingredients: [
      '300g daging ikan tenggiri giling',
      '200g tepung sagu',
      '1 butir telur',
      'Kuah cuko: gula merah, asam jawa, cabai',
      'Timun serut dan mie kuning',
    ],
    steps: [
      'Campur ikan, sagu, dan bumbu hingga kalis.',
      'Bentuk pempek, rebus hingga mengapung, lalu goreng.',
      'Sajikan dengan kuah cuko, timun, dan mie kuning.',
    ],
  ),
  Recipe(
    id: 'rawon',
    name: 'Rawon',
    origin: 'Surabaya, Jawa Timur',
    imageUrl:
        'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?auto=format&fit=crop&w=1200&q=80&sat=-10',
    rating: 4.6,
    price: 52000,
    description:
        'Sup daging sapi berkuah hitam pekat dari kluwek, disajikan dengan tauge pendek.',
    ingredients: [
      '500g daging sapi sandung lamur',
      '5 buah kluwek, ambil isinya',
      'Bumbu halus: bawang, kemiri, ketumbar',
      'Serai, daun jeruk, lengkuas',
      'Tauge pendek dan sambal',
    ],
    steps: [
      'Rebus daging hingga empuk, potong-potong.',
      'Tumis bumbu halus dan kluwek, masukkan ke kaldu.',
      'Didihkan hingga pekat, sajikan dengan tauge dan sambal.',
    ],
  ),
  Recipe(
    id: 'bakso',
    name: 'Bakso Malang',
    origin: 'Malang, Jawa Timur',
    imageUrl:
        'https://images.unsplash.com/photo-1608897013039-887f21d8c804?auto=format&fit=crop&w=1200&q=80',
    rating: 4.5,
    price: 35000,
    description:
        'Bola daging sapi kenyal dengan kuah kaldu gurih, disajikan dengan mie dan pangsit.',
    ingredients: [
      '400g daging sapi giling',
      '100g tepung tapioka',
      'Bawang putih goreng, lada, garam',
      'Kaldu sapi untuk kuah',
      'Mie, pangsit, seledri, bawang goreng',
    ],
    steps: [
      'Blender daging dengan bumbu dan tapioka hingga halus.',
      'Bentuk bola, rebus hingga mengapung.',
      'Sajikan dengan kuah kaldu, mie, dan pelengkap.',
    ],
  ),
  Recipe(
    id: 'ayam-betutu',
    name: 'Ayam Betutu',
    origin: 'Bali',
    imageUrl:
        'https://images.unsplash.com/photo-1610348725531-843dff563e2c?auto=format&fit=crop&w=1200&q=80',
    rating: 4.7,
    price: 65000,
    description:
        'Ayam utuh dimasak dengan base genep khas Bali, menghasilkan rasa pedas aromatik.',
    ingredients: [
      '1 ekor ayam kampung',
      'Base genep: bawang, cabai, kunyit, jahe, kencur',
      'Daun jeruk, serai, salam',
      'Santan encer',
      'Jeruk limau untuk penyajian',
    ],
    steps: [
      'Lumuri ayam dengan base genep dan rempah, diamkan.',
      'Masak perlahan dalam santan hingga empuk.',
      'Panggang sebentar untuk aroma, sajikan hangat.',
    ],
  ),
];


const String baseUrl = "https://carify-iota.vercel.app/";
// https://carify-iota.vercel.app/brand?&offset=$offset&limit=$limit
const String allBrands = "${baseUrl}brand?";
const String deleteBrand = "${baseUrl}brand/";

const Map<String, String> requestHeaders = {
  // 'Content-Type': 'application/json',
  'Content-Type': 'multipart/form-data',

  'token':
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1lZG8xMjMuYmFrZWVyQGdtYWlsLmNvbSIsImlkIjoiNjU2N2QyODZhODU0OGNmNmIyOTAxYmJlIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNzAxOTIyMTc0fQ.UQpbRA7gSn0Abj-gLT6Qr3bhowecsyD1HmREncRfzuc'
};
const Map<String, String> requestHeadersGet = {
  'Content-Type': 'application/json',
  // 'Content-Type': 'multipart/form-data',

  'token':
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1lZG8xMjMuYmFrZWVyQGdtYWlsLmNvbSIsImlkIjoiNjU2N2QyODZhODU0OGNmNmIyOTAxYmJlIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNzAxOTIyMTc0fQ.UQpbRA7gSn0Abj-gLT6Qr3bhowecsyD1HmREncRfzuc'
};
Map brandEqual = {
  '6547c2ea253bcfbdd4cc94a0': 'assets/logo_brand/Al.png',
  '6547c2ea253bcfbdd4cc94a6': 'assets/logo_brand/audi.webp',
  // 'BMW': 'assets/logo/BMW.png',
  '6547c2ea253bcfbdd4cc94b0': 'assets/logo/Chevrolet_logo_PNG3.png',
  '6547c2ea253bcfbdd4cc94b2': 'assets/logo/Citroen_logo_PNG4.png',
  '6547c2ea253bcfbdd4cc94b5': 'assets/logo/Daewoo_logo_PNG3.png',
  //  'DODGE': 'assets/logo/Dodge_logo_PNG10.png',
  '6547c2ea253bcfbdd4cc94be': 'assets/logo/Ferrari_logo_PNG11.png',
  //'FIAT': 'assets/logo/Fiat_logo_PNG1.gif',
  // 'FORD': 'assets/logo/Ford_logo_PNG2.png',
  '6547c2ea253bcfbdd4cc94c3': 'assets/logo/Geely_logo_PNG2.png',
  '6547c2ea253bcfbdd4cc94ca': 'assets/logo/Honda_logo_PNG4.png',
  //'HUMMER': 'assets/logo_brand/Hummer.webp',
  '6547c2ea253bcfbdd4cc94d1': 'assets/logo_brand/jeep.webp',
  '6547c2ea253bcfbdd4cc94d3': 'assets/logo/KIA_logo_PNG2.png',
  '6547c2ea253bcfbdd4cc94d6': 'assets/logo/Lada_logo_PNG1.png',
  '6547c2ea253bcfbdd4cc94d9': 'assets/logo/Land-Rover_logo_PNG1.png',
  //'MESERATI': 'assets/logo_brand/maserati.webp',
  '6547c2ea253bcfbdd4cc94e4': 'assets/logo/Mazda_logo_PNG5.png',
  '6547c2ea253bcfbdd4cc94e7': 'assets/logo_brand/mercedes-amg.png',
  '6547c2ea253bcfbdd4cc94e6': 'assets/logo/Mercedes.png',
  '6547c2ea253bcfbdd4cc94e9': 'assets/logo/MG_logo_PNG11.png',
  '6547c2ea253bcfbdd4cc94ea': 'assets/logo/MINI_logo_PNG2.png',
  // 'MITSUBISHI': 'assets/logo/Mitsubishi_logo_PNG3.png',
  '6547c2ea253bcfbdd4cc94ee': 'assets/logo/Nissan_logo_PNG1.png',
  '6547c2ea253bcfbdd4cc94f0': 'assets/logo/Opel_logo_PNG14.png',
  '6547c2ea253bcfbdd4cc94f4': 'assets/logo_brand/Peugeot.webp',
  '6547c2ea253bcfbdd4cc94f9': 'assets/logo/Porsche_logo_PNG5.png',
  '6547c2ea253bcfbdd4cc94fa': 'assets/logo/Proton_logo_PNG2.png',
  '6547c2ea253bcfbdd4cc94fc': 'assets/logo/Ram-Logo-PNG_008.png',
  '6547c2ea253bcfbdd4cc94fd': 'assets/logo_brand/Renault.webp',
  '6547c2ea253bcfbdd4cc9508': 'assets/logo/Škoda_logo_PNG3.png',
  '6547c2ea253bcfbdd4cc950c': 'assets/logo/Subaru_logo_PNG3.png',
  '6547c2ea253bcfbdd4cc94e1': 'assets/logo/Maruti_Suzuki_Logo_PNG6.png',
  '6547c2ea253bcfbdd4cc950d': 'assets/logo/Suzuki_logo_PNG2.png',
  //  'TESLA': 'assets/logo/Tesla.png',
  '6547c2ea253bcfbdd4cc9510': 'assets/logo/Toyota_logo_PNG15.png',
  '6547c2ea253bcfbdd4cc9515': 'assets/logo/Volvo_logo_PNG1.png',
  '6548e7c51efeac0c7a8a1539': 'assets/logo/BYD_logo_PNG5.png',
  '65482a48376318723e12bb05': 'assets/logo/Seat_logo_PNG3-scaled.jpg',
  '65482a079aaafd00229edfea': 'assets/logo/Infiniti_logo_PNG10.png',
  '6548297016de8cec08cd31b3': 'assets/logo/Cupra_logo_PNG4.png',
  '6548230a81b18b9380ed1fa7': 'assets/logo/Daihatsu_logo_PNG15.png',
  //'HYUNDAI': 'assets/logo/Hyundai_logo_PNG2.png',
  '6547c2ea253bcfbdd4cc9514': 'assets/logo/Volkswagen_logo_PNG1.png'
};

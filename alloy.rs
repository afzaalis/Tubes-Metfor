//ALLOY DARI CLASS DIAGRAM YANG DIBUAT

abstract sig String {}

sig User {
  nama_pelanggan: String,
  username_pelanggan: String,
  password_pelanggan: String,
  verifyUser: Bool
}

sig Halaman_reservasi_PC {
  nomorPC: Int,
  spekPC: String
}

sig Pembayaran {
  jenis_bank: String,
  nominal: Int
}

sig Resi {
  nominal: Int,
  buktiBeli: String,
  pembayaran: Pembayaran
}

fact {
  // Relasi antara pembayaran dan Resi
  Resi.pembayaran.nominal = Pembayaran.nominal
}

pred show {
  // Menunjukkan constraint yang relevan
  all r: Resi | r.nominal > 0
  all p: Pembayaran | p.nominal > 0
}

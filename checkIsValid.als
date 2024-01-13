// Signature
sig AccPengguna {}

sig User {
  nama_pelanggan: String,
  username_pelanggan: String,
  password_pelanggan: String,
}

sig Halaman_reservasi_PC {
  nomorPC: Int,
  spekPC: AccPengguna
}

sig Pembayaran {
  jenis_bank: AccPengguna,
  nominal: Int
}

sig PC {
  infoPC: Halaman_reservasi_PC
}

sig Resi {
  nominal: Int,
  buktiBeli: Pembayaran,
}

// Predicates
pred NonEmptyUserCredentials {
  all u: User | u.nama_pelanggan != none and u.username_pelanggan != none and u.password_pelanggan != none
}

pred PositivePaymentNominal {
  all p: Pembayaran | p.nominal > 0
}

pred showNominal {
  all p: Pembayaran | p.nominal > 0
}

pred UniquePCNumber {
  all pc1, pc2: Halaman_reservasi_PC | pc1 != pc2 => pc1.nomorPC != pc2.nomorPC
}

pred infoPC {
  all pc: Halaman_reservasi_PC | some p: PC | p.infoPC = pc
}

pred showInfoPC {
  all pc: Halaman_reservasi_PC | some p: PC | p.infoPC = pc
}

pred showBuktiPembelian {
  all r: Resi | one p: Pembayaran | r.buktiBeli = p
}

pred show {
  all u: User |
    some h: Halaman_reservasi_PC |
      some p: Pembayaran |
        some r: Resi |
          u.nama_pelanggan != none and
          u.username_pelanggan != none and
          u.password_pelanggan != none and
          p.nominal > 0 and
          r.buktiBeli = p and
          h.spekPC = p.jenis_bank
}

// Assertions
assert PositivePaymentNominal {
  all p: Pembayaran | p.nominal < 0 and p.nominal != 5
}

fact ValidPositivePaymentNominal {
  all p: Pembayaran | p.nominal < 0 and p.nominal != 5
}

//run

// Check
check PositivePaymentNominal for 2

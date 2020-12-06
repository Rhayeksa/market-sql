use
  database_market_sql;
delimiter / /
create procedure GetAllProduk()
begin
  select
    produk.id_produk as 'Kode',
    produk.nama_produk as 'Nama',
    produk.stok_produk as 'Stok',
    produk.created_at as 'Created At',
    produk.updated_at as 'Updated At'
  from
    ((produk
  inner join pembelian on produk.id_produk = pembelian.id_produk)
  inner join penjualan on produk.id_produk = penjualan.id_produk);
end / /
delimiter / /
create procedure GetProdukById(
  in id_produk_param varchar(45)
)
begin
  select
    id_produk as 'Kode Produk',
    nama_produk as 'Nama Produk',
    stok_produk as 'Stok',
    created_at as 'Created At',
    updated_at as 'Updated At'
  from produk
  where id_produk = id_produk_param;
end / /
delimiter / /
create procedure GetAllPemasok()
begin
  select
    id_pemasok as 'Kode',
    nama_pemasok as 'Nama Pemasok',
    email_pemasok as 'Email',
    phone_pemasok as 'Kontak',
    alamat_pemasok as 'Alamat',
    created_at as 'Created At',
    updated_at as 'Updated At'
  from
    pemasok;
end / /
delimiter / /
create procedure GetPemasokById(
  in id_pemasok_param varchar(45)
)
begin
  select
    id_pemasok as 'Kode',
    nama_pemasok as 'Nama Pemasok',
    email_pemasok as 'Email',
    phone_pemasok as 'Kontak',
    alamat_pemasok as 'Alamat',
    created_at as 'Created At',
    updated_at as 'Updated At'
  from
    pemasok
  where
    id_pemasok = id_pemasok_param;
end / /
delimiter / /
create procedure GetAllPelanggan()
begin
  select
    id_pelanggan as 'Kode',
    nama_pelanggan as 'Nama Pelanggan',
    email_pelanggan as 'Email',
    phone_pelanggan as 'Kontak',
    alamat_pelanggan as 'Alamat',
    created_at as 'Created At',
    updated_at as 'Updated At'
  from
    pelanggan;
end / /
delimiter / /
create procedure GetPelangganById(
  in id_pelanggan_param varchar(45)
)
begin
  select
    id_pelanggan as 'Kode',
    nama_pelanggan as 'Nama Pelanggan',
    email_pelanggan as 'Email',
    phone_pelanggan as 'Kontak',
    alamat_pelanggan as 'Alamat',
    created_at as 'Created At',
    updated_at as 'Updated At'
  from
    pelanggan
  where
    id_pelanggan = id_pelanggan_param;
end / /
delimiter / /
create procedure GetAllDetailTransaksiPembelian()
begin
  select
    transaksi_pembelian.id_transaksi_pembelian as 'Kode Transaksi',
    pembelian.id_pembelian as 'Kode Pembelian',
    pemasok.nama_pemasok as 'Pemasok',
    produk.nama_produk as 'Produk',
    pembelian.harga_pembelian as 'Harga',
    pembelian.banyak_pembelian as 'Banyak',
    pembelian.total_harga_pembelian as 'Total',
    transaksi_pembelian.created_at as 'Created At',
    transaksi_pembelian.updated_at as 'Updated At'
  from (((transaksi_pembelian
    inner join pemasok on transaksi_pembelian.id_pemasok = pemasok.id_pemasok)
    inner join pembelian on transaksi_pembelian.id_pembelian = pembelian.id_pembelian)
    inner join produk on transaksi_pembelian.id_produk = produk.id_produk);
end / /
delimiter / /
create procedure GetDetailTransaksiPembelianById(
  in id_transaksi_pembelian_param varchar(45)
)
begin
  select
    transaksi_pembelian.id_transaksi_pembelian as 'Kode Transaksi',
    pembelian.id_pembelian as 'Kode Pembelian',
    pemasok.nama_pemasok as 'Pemasok',
    produk.nama_produk as 'Produk',
    pembelian.harga_pembelian as 'Harga',
    pembelian.banyak_pembelian as 'Banyak',
    pembelian.total_harga_pembelian as 'Total',
    transaksi_pembelian.created_at as 'Created At',
    transaksi_pembelian.updated_at as 'Updated At'
  from (((transaksi_pembelian
    inner join pemasok on transaksi_pembelian.id_pemasok = pemasok.id_pemasok)
    inner join pembelian on transaksi_pembelian.id_pembelian = pembelian.id_pembelian)
    inner join produk on transaksi_pembelian.id_produk = produk.id_produk)
  where
    id_transaksi_pembelian = id_transaksi_pembelian_param;
end / /
delimiter / /
create procedure GetDetailTransaksiPembelianByIdPemasok(
  in id_pemasok_param varchar(45)
)
begin
  select
    transaksi_pembelian.id_transaksi_pembelian as 'Kode Transaksi',
    pembelian.id_pembelian as 'Kode Pembelian',
    pemasok.nama_pemasok as 'Pemasok',
    produk.nama_produk as 'Produk',
    pembelian.harga_pembelian as 'Harga',
    pembelian.banyak_pembelian as 'Banyak',
    pembelian.total_harga_pembelian as 'Total',
    transaksi_pembelian.created_at as 'Created At',
    transaksi_pembelian.updated_at as 'Updated At'
  from (((transaksi_pembelian
    inner join pemasok on transaksi_pembelian.id_pemasok = pemasok.id_pemasok)
    inner join pembelian on transaksi_pembelian.id_pembelian = pembelian.id_pembelian)
    inner join produk on transaksi_pembelian.id_produk = produk.id_produk)
  where
    id_pemasok = id_pemasok_param;
end / /
delimiter / /
create procedure GetDetailTransaksiPembelianByIdProduk(
  in id_produk_param varchar(45)
)
begin
  select
    transaksi_pembelian.id_transaksi_pembelian as 'Kode Transaksi',
    pembelian.id_pembelian as 'Kode Pembelian',
    pemasok.nama_pemasok as 'Pemasok',
    produk.nama_produk as 'Produk',
    pembelian.harga_pembelian as 'Harga',
    pembelian.banyak_pembelian as 'Banyak',
    pembelian.total_harga_pembelian as 'Total',
    transaksi_pembelian.created_at as 'Created At',
    transaksi_pembelian.updated_at as 'Updated At'
  from (((transaksi_pembelian
    inner join pemasok on transaksi_pembelian.id_pemasok = pemasok.id_pemasok)
    inner join pembelian on transaksi_pembelian.id_pembelian = pembelian.id_pembelian)
    inner join produk on transaksi_pembelian.id_produk = produk.id_produk)
  where
    id_produk = id_produk_param;
end / /
delimiter / /
create procedure GetAllDetailTransaksiPenjualan()
begin
  select
    transaksi_penjualan.id_transaksi_penjualan as 'Kode Transaksi',
    penjualan.id_penjualan as 'Kode penjualan',
    pelanggan.nama_pelanggan as 'Pelanggan',
    produk.nama_produk as 'Produk',
    penjualan.harga_penjualan as 'Harga',
    penjualan.banyak_penjualan as 'Banyak',
    penjualan.total_harga_penjualan as 'Total',
    transaksi_penjualan.created_at as 'Created At',
    transaksi_penjualan.updated_at as 'Updated At'
  from (((transaksi_penjualan
    inner join pelanggan on transaksi_penjualan.id_pelanggan = pelanggan.id_pelanggan)
    inner join penjualan on transaksi_penjualan.id_penjualan = penjualan.id_penjualan)
    inner join produk on transaksi_penjualan.id_produk = produk.id_produk);
end / /
delimiter / /
create procedure GetDetailTransaksiPenjualanById(
  in id_transaksi_penjualan_param varchar(45)
)
begin
  select
    transaksi_penjualan.id_transaksi_penjualan as 'Kode Transaksi',
    penjualan.id_penjualan as 'Kode penjualan',
    pelanggan.nama_pelanggan as 'Pelanggan',
    produk.nama_produk as 'Produk',
    penjualan.harga_penjualan as 'Harga',
    penjualan.banyak_penjualan as 'Banyak',
    penjualan.total_harga_penjualan as 'Total',
    transaksi_penjualan.created_at as 'Created At',
    transaksi_penjualan.updated_at as 'Updated At'
  from 
    (((transaksi_penjualan
    inner join pelanggan on transaksi_penjualan.id_pelanggan = pelanggan.id_pelanggan)
    inner join penjualan on transaksi_penjualan.id_penjualan = penjualan.id_penjualan)
    inner join produk on transaksi_penjualan.id_produk = produk.id_produk)
  where
    id_transaksi_penjualan = id_transaksi_penjualan_param;
end / /
delimiter / /
create procedure GetDetailTransaksiPenjualanByIdPelanggan(
  in id_pelanggan_param varchar(45)
)
begin
  select
    transaksi_penjualan.id_transaksi_penjualan as 'Kode Transaksi',
    penjualan.id_penjualan as 'Kode penjualan',
    pelanggan.nama_pelanggan as 'Pelanggan',
    produk.nama_produk as 'Produk',
    penjualan.harga_penjualan as 'Harga',
    penjualan.banyak_penjualan as 'Banyak',
    penjualan.total_harga_penjualan as 'Total',
    transaksi_penjualan.created_at as 'Created At',
    transaksi_penjualan.updated_at as 'Updated At'
  from
    (((transaksi_penjualan
    inner join pelanggan on transaksi_penjualan.id_pelanggan = pelanggan.id_pelanggan)
    inner join penjualan on transaksi_penjualan.id_penjualan = penjualan.id_penjualan)
    inner join produk on transaksi_penjualan.id_produk = produk.id_produk)
  where
    id_pelanggan = id_pelanggan_param;
end / /
delimiter / /
create procedure InsertProduk(
  in id_produk_param varchar(45),
  in nama_produk_param varchar(45)
)
begin
  insert into 
    produk
  set
    id_produk = id_produk_param,
    nama_produk = nama_produk_param;
end / /
delimiter / /
create procedure InsertPemasok(
  in nama_pemasok_param varchar(45),
  in email_pemasok_param varchar(45),
  in phone_pemasok_param varchar(45),
  in alamat_pemasok_param varchar(255)
)
begin
  insert into
    pemasok
  set 
    nama_pemasok = nama_pemasok_param,
    email_pemasok = email_pemasok_param,
    phone_pemasok = phone_pemasok_param,
    alamat_pemasok = alamat_pemasok_param;
  update
    pemasok
  set
    id_pemasok = concat(
      id_pemasok,
      mid(created_at, 1, 4),
      mid(created_at, 6, 2),
      mid(created_at, 9, 2),
      mid(created_at, 12, 2),
      mid(created_at, 15, 2),
      mid(created_at, 18, 2)
    )
  where
    id_pemasok = 'PMS';
end / /
delimiter / /
create procedure InsertPelanggan(
  in nama_pelanggan_param varchar(45),
  in email_pelanggan_param varchar(45),
  in phone_pelanggan_param varchar(45),
  in alamat_pelanggan_param varchar(255)
)
begin
  insert into
    pelanggan
  set 
    nama_pelanggan = nama_pelanggan_param,
    email_pelanggan = email_pelanggan_param,
    phone_pelanggan = phone_pelanggan_param,
    alamat_pelanggan = alamat_pelanggan_param;
  update
    pelanggan
  set
    id_pelanggan = concat(
      id_pelanggan,
      mid(created_at, 1, 4),
      mid(created_at, 6, 2),
      mid(created_at, 9, 2),
      mid(created_at, 12, 2),
      mid(created_at, 15, 2),
      mid(created_at, 18, 2))
  where
    id_pelanggan = 'PMS';
end / /
delimiter / /
create procedure InsertTransaksiPembelian(
  in id_pemasok_param varchar(45),
  in id_produk_param varchar(45),
  in harga_pembelian_param int,
  in banyak_pembelian_param int,
  in deskripsi_transaksi_pembelian_param varchar(255)
)
begin
  insert into
    pembelian
  set
    harga_pembelian = harga_pembelian_param,
    banyak_pembelian = banyak_pembelian_param,
    total_harga_pembelian = harga_pembelian * banyak_pembelian,
    id_produk = id_produk_param;
  update
    pembelian
  set
    id_pembelian = concat(
      id_pembelian,
      cast(no_urut as varchar(45))
    )
  where
    id_pembelian = 'PMB';
  insert into
    transaksi_pembelian
  set
    id_pemasok = id_pemasok_param,
    id_pembelian = (select max(id_pembelian) from pembelian),
    id_produk = id_produk_param;
  update
    transaksi_pembelian
  set
    id_transaksi_pembelian = concat(
      id_transaksi_pembelian,
      mid(created_at, 1, 4),
      mid(created_at, 6, 2),
      mid(created_at, 9, 2),
      mid(created_at, 12, 2)
  )
  where
    id_transaksi_pembelian = 'TRSPMB';
end / /
delimiter / /
create procedure InsertTransaksiPenjualan(
  in id_pelanggan_param varchar(45),
  in id_produk_param varchar(45),
  in harga_penjualan_param int,
  in banyak_penjualan_param int,
  in deskripsi_transaksi_penjualan_param varchar(255)
)
begin
  -- update
  insert into
    penjualan
  set
    harga_penjualan = harga_penjualan_param,
    banyak_penjualan = banyak_penjualan_param,
    total_harga_penjualan = harga_penjualan * banyak_penjualan,
    id_produk = id_produk_param;
  update
    penjualan
  set
    id_penjualan = concat(
      id_penjualan,
      cast(no_urut as varchar(45))
    )
  where
    id_penjualan = 'PNJ';
  insert into
    transaksi_penjualan
  set
    id_pelanggan = id_pelanggan_param,
    id_penjualan = (select max(id_penjualan) from penjualan),
    id_produk = id_produk_param,
    deskripsi_transaksi_penjualan = deskripsi_transaksi_penjualan_param;
  update
    transaksi_penjualan
  set
    id_transaksi_penjualan = concat(
      id_transaksi_penjualan,
      mid(created_at, 1, 4),
      mid(created_at, 6, 2),
      mid(created_at, 9, 2),
      mid(created_at, 12, 2)
    )
  where
    id_transaksi_penjualan = 'TRSPNJ';
end / /
delimiter / /
create procedure UpdateProdukById(
  id_produk_param varchar(45),
  nama_produk_param varchar(45)
)
begin
  update
    produk
  set
    nama_produk = nama_produk_param,
    updated_at = current_timestamp()
  where
    id_produk = id_produk_param;
end / /
delimiter / /
create procedure UpdatePemasokById(
  in id_pemasok_param varchar(45),
  in nama_pemasok_param varchar(45),
  in email_pemasok_param varchar(45),
  in phone_pemasok_param varchar(45),
  in alamat_pemasok_param varchar(255)
)
begin
  update
    pemasok
  set
    nama_pemasok = nama_pemasok_param,
    email_pemasok = email_pemasok_param,
    phone_pemasok = phone_pemasok_param,
    alamat_pemasok = alamat_pemasok_param,
    updated_at = current_timestamp()
  where
    id_pemasok = id_pemasok_param;
end / /
delimiter / /
create procedure UpdatePelangganById(
  in id_pelanggan_param varchar(45),
  in nama_pelanggan_param varchar(45),
  in email_pelanggan_param varchar(45),
  in phone_pelanggan_param varchar(45),
  in alamat_pelanggan_param varchar(255)
)
begin
  update
    pelanggan
  set
    nama_pelanggan = nama_pelanggan_param,
    email_pelanggan = email_pelanggan_param,
    phone_pelanggan = phone_pelanggan_param,
    alamat_pelanggan = alamat_pelanggan_param,
    updated_at = current_timestamp()
  where
    id_pelanggan = id_pelanggan_param;
end / /
delimiter / /
create procedure UpdateTransaksiPembelianByIdAndIdPembelian(
  in id_transaksi_pembelian_param varchar(45),
  in id_pembelian_param varchar(45),
  in id_pemasok_param varchar(45),
  in id_produk_param varchar(45),
  in harga_pembelian_param int,
  in banyak_pembelian_param int,
  in deskripsi_transaksi_pembelian_param varchar(255)
)
begin
  delete from
    transaksi_pembelian
  where
    id_pembelian = id_pembelian_param;
  delete from
    pembelian
  where
    id_pembelian = id_pembelian_param;
  insert into
    pembelian
  set
    id_pembelian = id_pembelian_param,
    id_produk = id_produk_param,
    harga_pembelian = harga_pembelian_param,
    banyak_pembelian = banyak_pembelian_param,
    total_harga_pembelian = harga_pembelian * banyak_pembelian,
    updated_at = current_timestamp();
  insert into
    transaksi_pembelian
  set
    id_transaksi_pembelian = id_transaksi_pembelian_param,
    id_pemasok = id_pemasok_param,
    id_pembelian = id_pembelian_param,
    id_produk = id_produk_param,
    deskripsi_transaksi_pembelian = deskripsi_transaksi_pembelian_param,
    updated_at = current_timestamp();
end / /
delimiter / /
create procedure UpdateTransaksiPenjualanByIdAndIdPenjualan(
  in id_transaksi_penjualan_param varchar(45),
  in id_penjualan_param varchar(45),
  in id_pelanggan_param varchar(45),
  in id_produk_param varchar(45),
  in harga_pelanggan_param int,
  in banyak_pelanggan_param int,
  in deskripsi_transaksi_pelanggan_param varchar(45)
)
begin
  delete from
    transaksi_penjualan
  where
    id_penjualan = id_penjualan_param;
  delete from
    penjualan
  where
    id_penjualan = id_penjualan_param;
  insert into
    penjualan
  set
    id_penjualan = id_penjualan_param,
    id_produk = id_produk_param,
    harga_penjualan = harga_penjualan_param,
    banyak_penjualan = banyak_penjualan_param,
    total_harga_penjualan = harga_penjualan * banyak_penjualan,
    updated_at = current_timestamp();
  insert into
    transaksi_penjualan
  set
    id_transaksi_penjualan = id_transaksi_penjualan_param,
    id_pelanggan = id_pelanggan_param,
    id_penjualan = id_penjualan_param,
    id_produk = id_produk_param,
    deskripsi_transaksi_penjualan = deskripsi_transaksi_penjualan_param,
    updated_at = current_timestamp();
end / /
delimiter / /
create procedure DeleteProdukById(
  in id_produk_param varchar(45)
)
begin
  if (
    (select count(id_produk) from pembelian where id_produk = id_produk_param) > 0 || 
    (select count(id_produk) from penjualan where id_produk = id_produk_param) > 0
  )
    then
      select
        'Kode produk sudah tercatat di tabel lain' as message;
  else
    delete from
      produk
    where
      id_produk = id_produk_param;
  end if;
end / /
delimiter / /
create procedure DeletePemasokById(
  in id_pemasok varchar(45)
)
begin
  if (
    (select count(id_pemasok) from transaksi_pembelian where id_pemasok = id_pemasok_param) > 0
  )
    then
      select
        'Kode pemasok sudah tercatat di tabel lain' as message;
  else
    delete from
      pemasok
    where
      id_pemasok = id_pemasok_param;
  end if;
end / /
delimiter / /
create procedure DeletePelangganById(
  in id_pelanggan_param varchar(45)
)
begin
  if (
    (select count(id_pelanggan) from transaksi_penjualan where id_pelanggan = id_pelanggan_param) > 0
  )
    then
      select
        'Kode Pelanggan sudah tercatat di tabel lain' as message;
  else
    delete from
      pelanggan
    where
      id_pelanggan = id_pelanggan_param;
  end if;
end / /
delimiter / /
create procedure DeleteTransaksiPembelianByIdAndIdPembelian(
  in id_transaksi_pembelian_param varchar(45),
  in id_pembelian_param varchar(45)
)
begin
  if (
    (select count(id_transaksi_pembelian) from transaksi_pembelian where id_transaksi_pembelian = id_transaksi_pembelian_param) > 1
  )
    then
      delete from
        transaksi_pembelian
      where
        id_pembelian = id_pembelian_param;
      delete from
        pembelian
      where
        id_pembelian = id_pembelian_param;
  else
    delete from
      transaksi_pembelian
    where
      id_transaksi_pembelian = id_transaksi_pembelian_param;
    delete from
      pembelian
    where
      id_pembelian = id_pembelian_param;
  end if;
end / /
delimiter / /
create procedure DeleteTransaksiPenjualanByIdAndIdPenjualan(
  in id_transaksi_penjualan_param varchar(45),
  in id_penjualan_param varchar(45)
)
begin
  if (
    (select count(id_transaksi_penjualan) from transaksi_penjualan where id_transaksi_penjualan = id_transaksi_penjualan_param) > 1
  )
    then
      delete from
        transaksi_penjualan
      where
        id_penjualan = id_penjualan_param;
      delete from
        penjualan
      where
        id_penjualan = id_penjualan_param;
  else
    delete from
      transaksi_penjualan
    where
      id_transaksi_penjualan = id_transaksi_penjualan_param;
    delete from
      penjualan
    where
      id_penjualan = id_penjualan_param;
  end if;
end / /
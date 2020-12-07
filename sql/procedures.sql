use
  database_market_sql;
-- get data
delimiter / /
  create procedure GetAllProduk()
  begin
    select
      produk.id as 'Kode',
      produk.nama as 'Nama',
      produk.stok as 'Stok',
      pembelian.harga as 'Harga Pembelian',
      pembelian.harga + 1000 as 'Harga Penjualan',
      produk.createdAt as 'Dibuat pada',
      produk.updatedAt as 'Diubah pada'
    from
      (produk
    inner join pembelian on produk.id = pembelian.produk_id);
  end 
/ /
delimiter / /
  create procedure GetProdukById(
    in id_p varchar(45)
  )
  begin
    select
      produk.id as 'Kode',
      produk.nama as 'Nama',
      produk.stok as 'Stok',
      pembelian.harga as 'Harga Pembelian',
      pembelian.harga + 1000 as 'Harga Penjualan',
      produk.createdAt as 'Dibuat pada',
      produk.updatedAt as 'Diubah pada'
    from
      (produk
    inner join pembelian on produk.id = pembelian.produk_id)
    where id = id_p;
  end
/ /
delimiter / /
  create procedure GetAllPemasok()
  begin
    select
      id as 'ID',
      nama as 'Nama',
      email as 'Email',
      phone as 'Kontak',
      alamat as 'Alamat',
      createdAt as 'Dibuat pada',
      updatedAt as 'Diubah pada'
    from
      pemasok;
  end
/ /
delimiter / /
  create procedure GetPemasokById(
    in id_p varchar(45)
  )
  begin
    select
      id as 'ID',
      nama as 'Nama',
      email as 'Email',
      phone as 'Kontak',
      alamat as 'Alamat',
      createdAt as 'Dibuat pada',
      updatedAt as 'Diubah pada'
    from
      pemasok
    where
      id = id_p;
  end
/ /
delimiter / /
  create procedure GetAllPelanggan()
    begin
      select
        id as 'ID',
        nama as 'Nama',
        email as 'Email',
        phone as 'Kontak',
        alamat as 'Alamat',
        createdAt as 'Dibuat pada',
        updatedAt as 'Diubah pada'
      from
        pelanggan;
    end
/ /
delimiter / /
  create procedure GetPelangganById(
    in id_p varchar(45)
  )
  begin
    select
      id as 'ID',
      nama as 'Nama',
      email as 'Email',
      phone as 'Kontak',
      alamat as 'Alamat',
      createdAt as 'Dibuat pada',
      updatedAt as 'Diubah pada'
    from
      pelanggan
    where
      id_pelanggan = id_pelanggan_p;
  end 
/ /
delimiter / /
  create procedure GetTransaksiPembelian()
  begin
  -- todo
  end
/ /
delimiter / /
  create procedure GetTransaksiPembelianById(
    in id_p varchar(45)
  )
  begin
  -- todo
  end
/ /
delimiter / /
  create procedure GetTransaksiPenjualan()
  begin
  -- todo
  end
/ /
delimiter / /
  create procedure GetTransaksiPenjualanById(
    in id_p varchar(45)
  )
  begin
  -- todo
  end
/ /
-- insert data
delimiter / /
  create procedure InsertProduk(
    in id_p varchar(45),
    in nama_p varchar(45)
  )
  begin
    insert into 
      produk
    set
      id = id_p,
      nama = nama_p;
  end
/ /
delimiter / /
  create procedure InsertPemasok(
    in nama_p varchar(45),
    in email_p varchar(45),
    in phone_p varchar(45),
    in alamat_p varchar(255)
  )
  begin
    insert into
      pemasok
    set
      nama = nama_p,
      email = email_p,
      phone = phone_p,
      alamat = alamat_p,
      id = concat(
        'PMS',
        mid(createdAt, 9, 2),
        mid(createdAt, 6, 2),
        mid(createdAt, 3, 2),
        right(phone, 3)
      );
  end
/ /
delimiter / /
  create procedure InsertPelanggan(
    in nama_p varchar(45),
    in email_p varchar(45),
    in phone_p varchar(45),
    in alamat_p varchar(255)
  )
  begin
    insert into
      pelanggan
    set 
      nama = nama_p,
      email = email_p,
      phone = phone_p,
      alamat = alamat_p,
      id = concat(
        'PEL',
        mid(createdAt, 9, 2),
        mid(createdAt, 6, 2),
        mid(createdAt, 3, 2),
        right(phone, 3)
      );
  end
/ /
delimiter / /
  create procedure InsertTransaksiPembelian(
    in pemasok_id_p varchar(45),
    in produk_id_p varchar(45),
    in harga_p int,
    in banyak_p int
  )
  begin
    insert into
      pembelian
    set
      pemasok_id = pemasok_id_p,
      produk_id = produk_id_p,
      harga = harga_p,
      banyak = banyak_p,
      kode_pembelian = concat(
        'PMB',
        mid(createdAt, 9, 2),
        mid(createdAt, 6, 2),
        mid(createdAt, 3, 2),
        right(pemasok_id, 3)
      )
  end
/ /
delimiter / /
  create procedure InsertTransaksiPenjualan(
    in pelanggan_id_p varchar(45),
    in produk_id_p varchar(45),
    in harga_p int,
    in banyak_p int
  )
  begin
    insert into
      penjualan
    set
      pelanggan_id = pelanggan_id_p,
      produk_id = produk_id_p,
      harga = harga_p,
      banyak = banyak_p,
      id = concat(
        'PNJ',
        mid(createdAt, 9, 2),
        mid(createdAt, 6, 2),
        mid(createdAt, 3, 2),
        right(pelanggan_id, 3)
      )
  end
/ /
-- update data
delimiter / /
  create procedure UpdateProdukById(
    in id_p varchar(45),
    in nama_p varchar(45)
  )
  begin
    update
      produk
    set
      nama = nama_p,
      updatedAt = current_timestamp()
    where
      id = id_p;
  end
/ /
delimiter / /
  create procedure UpdatePemasokById(
    in id_p varchar(45),
    in nama_p varchar(45),
    in email_p varchar(45),
    in phone_p varchar(45),
    in alamat_p varchar(255)
  )
  begin
    update
      pemasok
    set
      nama = nama_p,
      email = email_p,
      phone = phone_p,
      alamat = alamat_p,
      updatedAt = current_timestamp()
    where
      id = id_p;
  end
/ /
delimiter / /
  create procedure UpdatePelangganById(
    in id_p varchar(45),
    in nama_p varchar(45),
    in email_p varchar(45),
    in phone_p varchar(45),
    in alamat_p varchar(255)
  )
  begin
    update
      pelanggan
    set
      nama = nama_p,
      email = email_p,
      phone = phone_p,
      alamat = alamat_p,
      updatedAt = current_timestamp()
    where
      id = id_p;
  end
/ /
-- delete data
delimiter / /
  create procedure DeleteProdukById(
    in id_p varchar(45)
  )
  begin
    if (
      (select count(produk_id) from pembelian where produk_id = id_p) > 0 || 
      (select count(produk_id) from penjualan where produk_id = id_p) > 0
    )
      then
        select
          'tidak dapat menghapus data produk, karena data produk telah tercatat di transaksi pembelian' as message;
    else
      delete from
        produk
      where
        id = id_p;
    end if;
  end / /
delimiter / /
  create procedure DeletePemasokById(
    in id_p varchar(45)
  )
  begin
    if (
      (select count(pemasok_id) from pembelian where pemasok_id = id_p) > 0
    )
      then
        select
          'tidak dapat menghapus data pemasok, karena data pemasok telah tercatat di transaksi pembelian' as message;
    else
      delete from
        pemasok
      where
        id = id_p;
    end if;
  end
/ /
delimiter / /
  create procedure DeletePelangganById(
    in id_p varchar(45)
  )
  begin
    if (
      (select count(pelanggan_id) from penjualan where pelanggan_id = id_p) > 0
    )
      then
        select
          'tidak dapat menghapus data pelanggan, karena data pelanggan telah tercatat di transaksi penjualan' as message;
    else
      delete from
        pelanggan
      where
        id = id_p;
    end if;
  end
/ /

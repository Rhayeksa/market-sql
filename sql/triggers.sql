use
  database_market_sql;
delimiter / /
  create trigger after_insert_pembelian
  after
    insert
      on pembelian for each row
  begin
    update
      produk
    set
      stok = stok + new.banyak
    where
      kode_produk = new.kode_produk;
  end
/ /
delimiter / /
  create trigger after_delete_pembelian
  after
    delete
      on pembelian for each row
  begin
    update
      produk
    set
      stok = stok - old.banyak
    where
      kode_produk = old.kode_produk;
  end
/ /
delimiter / /
  create trigger after_insert_penjualan
  after
    insert
      on penjualan for each row
  begin
    update
      produk
    set
      stok = stok - new.banyak
    where
      kode_produk = new.kode_produk;
  end 
/ /
delimiter / /
  create trigger after_penjualan_delete
  after
    delete
      on penjualan for each row
  begin
    update
      produk
    set
      stok = stok + old.banyak
    where
      kode_produk = old.kode_produk;
  end
/ /
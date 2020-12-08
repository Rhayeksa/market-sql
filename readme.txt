Langkah-langkah instalasi :
  1. Buka administrator DBMS, sebagai contoh phpmyadmin
  2. pilih import yang terdapat dinavbar kemudian pilih choose file dan cari file database.sql, kemudian pilih kirim.
  3. lakukan juga langkah 2 untuk file tables.sql, dummy.sql(opsional), trigger.sql, dan procedures.sql.

cara penggunaan :
  cara 1 :
    1. Buka administrator DBMS, sebagai contoh phpmyadmin, kemudian pilih SQL yang terdapat dinavbar
    2. selanjutnya ketik
        use agen; procedure_name_yang_tersedia('parameter');
    perhatian : procedure yang tersedia terdapat di file fitur.txt
  cara 2 :
    1. Buka administrator DBMS, sebagai contoh phpmyadmin, kemudian klik refresh pada sidebar, lalu pilih "prodject_agen_sql" yang terdapat di sidebar, dan pilih Routines
    2. kemudian eksekusi procedure yang dibutuhkan

cara pencatatan (menggunakan procedure) :
  1. ketika melakukan pembelian
    > InsertPemasok (bila ada pemasok baru, bila tidak langsung ke langkah berikutnya)
    > InsertTransaksiPembelian
  2. ketika melakukan penjualan
    > InsertPelanggan (bila ada pelanggan baru, bila tidak langsung ke langkah berikutnya)
    > InsertTransaksiPenjualan
  3. ketika ada produk baru
    > InsertProduk
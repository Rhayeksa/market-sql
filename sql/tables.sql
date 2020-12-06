use
  database_market_sql;
create
  table produk (
    kode_produk varchar(45) not null,
    nama varchar(45) not null,
    stok int not null,
    createdAt datetime not null default current_timestamp(),
    updateAt datetime not null default current_timestamp(),
    primary key (kode_produk)
);
create
  table pemasok (
    id_pemasok varchar(45) not null,
    nama varchar(45) not null,
    email varchar(45) not null,
    phone varchar(45) not null,
    alamat varchar(255) not null,
    createdAt datetime not null default current_timestamp(),
    updateAt datetime not null default current_timestamp(),
    primary key (id_pemasok)
);
create
  table pelanggan (
    id_pelanggan varchar(45) not null,
    nama varchar(45) not null,
    email varchar(45) not null,
    phone varchar(45) not null,
    alamat varchar(255) not null,
    createdAt datetime not null default current_timestamp(),
    updateAt datetime not null default current_timestamp(),
    primary key (id_pelanggan)
);
create
  table pembelian (
    kode_pembelian varchar(45) not null,
    harga int not null,
    banyak int not null,
    kode_produk varchar(45) not null,
    id_pemasok varchar(45) not null,
    createdAt datetime not null default current_timestamp(),
    updateAt datetime not null default current_timestamp(),
    constraint fk_pembelian_produk foreign key (kode_produk) references produk (kode_produk),
    constraint fk_pembelian_pemasok foreign key (id_pemasok) references pemasok (id_pemasok)
);
create
  table penjualan (
    kode_penjualan varchar(45) not null,
    harga int not null,
    banyak int not null,
    kode_produk varchar(45) not null,
    id_pelanggan varchar(45) not null,
    createdAt datetime not null default current_timestamp(),
    updateAt datetime not null default current_timestamp(),
    constraint fk_penjualan_produk foreign key (kode_produk) references produk (kode_produk),
    constraint fk_penjualan_pelanggan foreign key (id_pelanggan) references pelanggan (id_pelanggan)
);
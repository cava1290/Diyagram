CREATE TABLE [Kullanıcılar] (
	[id] int NOT NULL,
	[kullanıcıadı] nvarchar(max) DEFAULT '50',
	[şifre] nvarchar(max) DEFAULT '100',
	[rol] nvarchar(max) DEFAULT '20',
	[oluşturulma_tarihi] datetime,
	PRIMARY KEY ([id])
);

CREATE TABLE [Randevular] (
	[id] int NOT NULL,
	[kullanıcı_id] int,
	[randevu_tarihi] date,
	[randevu_saati] time(7),
	[oluşturulma_tarihi] datetime,
	PRIMARY KEY ([id])
);

CREATE TABLE [Siparişler] (
	[id] int NOT NULL,
	[kullanıcı_id] int,
	[adres] nvarchar(max) DEFAULT '255',
	[toplam_fiyat] decimal(18,0),
	[isim_soyisim] nvarchar(max) DEFAULT '100',
	PRIMARY KEY ([id])
);

CREATE TABLE [Yorumlar] (
	[kullanıcı_adi] nvarchar(max) DEFAULT '50',
	[yorum] nvarchar(max),
	[id] int NOT NULL,
	[yorum_id] int,
	[yorum_tarihi] date,
	[randevu_id] int,
	PRIMARY KEY ([id])
);

CREATE TABLE [İşlem_Geçmişi] (
	[id] int NOT NULL,
	[kullanici_id] int,
	[işlem_türü] nvarchar(max) DEFAULT '50',
	[işlem_detayı] nvarchar(max),
	[oluşturulma_tarihi] datetime,
	PRIMARY KEY ([id])
);


ALTER TABLE [Randevular] ADD CONSTRAINT [Randevular_fk1] FOREIGN KEY ([kullanıcı_id]) REFERENCES [Kullanıcılar]([id]);
ALTER TABLE [Siparişler] ADD CONSTRAINT [Siparişler_fk1] FOREIGN KEY ([kullanıcı_id]) REFERENCES [Kullanıcılar]([id]);
ALTER TABLE [Yorumlar] ADD CONSTRAINT [Yorumlar_fk3] FOREIGN KEY ([yorum_id]) REFERENCES [Siparişler]([id]);

ALTER TABLE [Yorumlar] ADD CONSTRAINT [Yorumlar_fk5] FOREIGN KEY ([randevu_id]) REFERENCES [Randevular]([id]);
ALTER TABLE [İşlem_Geçmişi] ADD CONSTRAINT [İşlem_Geçmişi_fk1] FOREIGN KEY ([kullanici_id]) REFERENCES [Kullanıcılar]([id]);
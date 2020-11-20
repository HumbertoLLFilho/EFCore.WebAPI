IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Batalha] (
    [Id] int NOT NULL IDENTITY,
    [Nome] nvarchar(max) NULL,
    [Descricao] nvarchar(max) NULL,
    [DtInicio] datetime2 NOT NULL,
    [DtFim] datetime2 NOT NULL,
    CONSTRAINT [PK_Batalha] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Heroi] (
    [Id] int NOT NULL IDENTITY,
    [Nome] nvarchar(max) NULL,
    [BatalhaId] int NOT NULL,
    CONSTRAINT [PK_Heroi] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Heroi_Batalha_BatalhaId] FOREIGN KEY ([BatalhaId]) REFERENCES [Batalha] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [Arma] (
    [Id] int NOT NULL IDENTITY,
    [Nome] nvarchar(max) NULL,
    [HeroiId] int NOT NULL,
    CONSTRAINT [PK_Arma] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Arma_Heroi_HeroiId] FOREIGN KEY ([HeroiId]) REFERENCES [Heroi] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_Arma_HeroiId] ON [Arma] ([HeroiId]);
GO

CREATE INDEX [IX_Heroi_BatalhaId] ON [Heroi] ([BatalhaId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201120192435_initial', N'5.0.0');
GO

COMMIT;
GO


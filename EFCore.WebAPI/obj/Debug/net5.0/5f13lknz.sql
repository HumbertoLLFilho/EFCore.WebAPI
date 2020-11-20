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

BEGIN TRANSACTION;
GO

ALTER TABLE [Heroi] DROP CONSTRAINT [FK_Heroi_Batalha_BatalhaId];
GO

DROP INDEX [IX_Heroi_BatalhaId] ON [Heroi];
GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Heroi]') AND [c].[name] = N'BatalhaId');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Heroi] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [Heroi] DROP COLUMN [BatalhaId];
GO

CREATE TABLE [HeroisBatalhas] (
    [HeroiId] int NOT NULL,
    [BatalhaId] int NOT NULL,
    CONSTRAINT [PK_HeroisBatalhas] PRIMARY KEY ([BatalhaId], [HeroiId]),
    CONSTRAINT [FK_HeroisBatalhas_Batalha_BatalhaId] FOREIGN KEY ([BatalhaId]) REFERENCES [Batalha] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_HeroisBatalhas_Heroi_HeroiId] FOREIGN KEY ([HeroiId]) REFERENCES [Heroi] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [identidade] (
    [Id] int NOT NULL IDENTITY,
    [NomeReal] int NOT NULL,
    [HeroiId] int NOT NULL,
    CONSTRAINT [PK_identidade] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_identidade_Heroi_HeroiId] FOREIGN KEY ([HeroiId]) REFERENCES [Heroi] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_HeroisBatalhas_HeroiId] ON [HeroisBatalhas] ([HeroiId]);
GO

CREATE UNIQUE INDEX [IX_identidade_HeroiId] ON [identidade] ([HeroiId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201120195755_HeroisBatalhas_Identidade', N'5.0.0');
GO

COMMIT;
GO

